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

    var gameEngine = GameEngine(player1 : "Player1", player2 : "Player2")
    var yourScore = 0
    var theirScore = 0
    
    
    @IBAction func flipCard(_ sender: UIButton) {
        if (gameEngine.gameOver()) {
            return
        }
        
        let (winner, card1, card2) = gameEngine.playOneTurn()
        var cards = [Card]()
        
        if card1 != nil {
            cards.append(card1!)
        }
        
        if card2 != nil {
            cards.append(card2!)
        }
        
        if (winner.name == "Player1") {
            winnerLabel.text = "You"
            yourScore += 1;
        }
        else {
            winnerLabel.text = "Opponenet"
            theirScore += 1;
        }
        
        playerCardLabel.text = card1?.description;
        opponentCardLabel.text = card2?.description;
        
        
        playerScoreLabel.text = String(yourScore)
        opponentScoreLabel.text = String(theirScore)
        
        gameEngine.award(cards : cards, to: winner)
    }
}
