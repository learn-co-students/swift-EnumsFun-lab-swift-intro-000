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
    
    var game = GameEngine(player1: "You", player2: "Opponent")
    var winner: Player?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateScoreBoard()
        
    }
    
    @IBAction func flipCard(_ sender: UIButton) {
        if !game.gameOver() {
            let round = game.playOneTurn()
            winner = round.0
            playerCardLabel.text = round.1!.description
            opponentCardLabel.text = round.2!.description
            let loot = [round.1!, round.2!]
            
            game.award(cards: loot, to: winner!)
            updateScoreBoard()
            
        } else {
            game = GameEngine(player1: "You", player2: "Opponent")
            winner = nil
            updateScoreBoard()
            
            playerCardLabel.text = "?"
            opponentCardLabel.text = "?"
            flipCardButton.titleLabel!.text = "Flip Card"
            
        }
        
        
     
    }
    
    func updateScoreBoard() {
        if game.gameOver() {
            flipCardButton.titleLabel!.text = "Play Again"
        }
        if let winner = winner {
            winnerLabel.text = winner.name
        } else {
            winnerLabel.text = "?"
        }
        playerScoreLabel.text = "\(game.player1.name): \(game.player1.hand.cards.count)"
        opponentScoreLabel.text = "\(game.player2.name): \(game.player2.hand.cards.count)"
    }
    
}
