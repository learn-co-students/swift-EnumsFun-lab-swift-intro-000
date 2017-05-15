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
    
    let gameEngine =  GameEngine(player1: "Bilbo", player2: "Frodo")
    
    var bilbo: Player {
        return gameEngine.player1
    }
    
    var frodo: Player {
        return gameEngine.player2
    }
    
    @IBAction func flipCard(_ sender: UIButton) {
        let (winner, bilboCard, frodoCard) = gameEngine.playOneTurn()
        
        if let bilboCard = bilboCard {
            playerCardLabel.text = bilboCard.description
        }
        
        if let frodoCard = frodoCard {
            opponentCardLabel.text = frodoCard.description
        }
        
        winnerLabel.text = "\(winner.name) wins!"
        
        playerScoreLabel.text = String(bilbo.hand.size)
        
        opponentScoreLabel.text = String(frodo.hand.size)
        
        if gameEngine.gameOver() {
            flipCardButton.isHidden = true
        }
    }
    
   
    
}
