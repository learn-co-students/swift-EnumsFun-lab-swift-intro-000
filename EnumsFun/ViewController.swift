//
//  ViewController.swift
//  EnumsFun
//
//  Created by Jim Campagno on 7/20/16.
//  Copyright © 2016 Gamesmith, LLC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var opponentCardLabel: UILabel!
    @IBOutlet weak var playerCardLabel: UILabel!
    @IBOutlet weak var winnerLabel: UILabel!
    @IBOutlet weak var playerScoreLabel: UILabel!
    @IBOutlet weak var opponentScoreLabel: UILabel!
    @IBOutlet weak var flipCardButton: UIButton!
    
    let game = GameEngine(player1: "Colin", player2: "Rita")
    var tiebreakerPot: [Card] = []
    
    @IBAction func flipCard(_ sender: UIButton) {
        let turn = game.playOneTurn()
        
        playerCardLabel.text = turn.1?.description
        opponentCardLabel.text = turn.2?.description
        
        if turn.0?.name == game.player1.name {
            game.award(cards: [turn.1!, turn.2!], to: game.player1)
            if let playerName = turn.0?.name {
                winnerLabel.text = "\(playerName) wins!"
            }
            if tiebreakerPot.count > 0 {
                game.award(cards: tiebreakerPot, to: game.player1)
                tiebreakerPot = []
            }
        } else if turn.0?.name == game.player2.name {
            game.award(cards: [turn.1!, turn.2!], to: game.player2)
            if let playerName = turn.0?.name {
                winnerLabel.text = "\(playerName) wins!"
            }
            if tiebreakerPot.count > 0 {
                game.award(cards: tiebreakerPot, to: game.player2)
                tiebreakerPot = []
            }
        } else {
            tiebreakerPot.append(turn.1!)
            tiebreakerPot.append(game.player1.flip()!)
            game.player1.lose(card: turn.1!)
            tiebreakerPot.append(turn.2!)
            tiebreakerPot.append(game.player2.flip()!)
            game.player2.lose(card: turn.2!)
            winnerLabel.text = "Tie!"
        }
        
        playerScoreLabel.text = "\(game.player1.name): \(game.player1.hand.size)"
        opponentScoreLabel.text = "\(game.player2.name): \(game.player2.hand.size)"
    }
    
   
    
}
