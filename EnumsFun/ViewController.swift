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
    
    var game: GameEngine!
    
    var you: Player {
        return game.player1
    }
    
    var opponent: Player {
        return game.player2
    }
    
    override func viewDidLoad() {
        game = GameEngine.init(player1: "Opponent", player2: "You")
        updateScore()
    }
    
    func updateGameOver() {
        if game.gameOver() {
            flipCardButton.isHidden = true
        }
    }
    
    func updateScore() {
        playerScoreLabel.text   = ("Your score: \(you.hand.size)")
        opponentScoreLabel.text = ("Opponent score: \(opponent.hand.size)")
    }
    
    @IBAction func flipCard(_ sender: UIButton) {
        let (winner, opponentCard, youCard) = game.playOneTurn()
        
        if winner.name == "You" {
            winnerLabel.text = "You win!"
        } else {
            winnerLabel.text = "Opponent win!"
        }
        
        if let youCard = youCard {
            playerCardLabel.text = youCard.description
        }
        
        if let opponentCard = opponentCard {
            opponentCardLabel.text = opponentCard.description
        }
        
        updateScore()
        updateGameOver()
    }
    
    
    
   
    
}
