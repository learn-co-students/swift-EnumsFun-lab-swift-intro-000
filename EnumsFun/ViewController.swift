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
    
    let warGame = GameEngine(player1: "Johnny", player2: "James")
    
    var johnny: Player {
        
        return warGame.player1
    }
    
    var james: Player {
        
        return warGame.player2
    }

    @IBAction func flipCard(_ sender: UIButton) {
        
        let (winner, johnnyCard, jamesCard) = warGame.playOneTurn()
        
        if let johnnyCard = johnnyCard {
            
            playerCardLabel.text = johnnyCard.description
            
        }
        
        if let jamesCard = jamesCard {
            
            opponentCardLabel.text = jamesCard.description
            
        }
        
        winnerLabel.text = "\(winner.name) has won!"
        
        playerScoreLabel.text = "\(johnny.name) hand size: \(johnny.hand.size)"
        
        opponentScoreLabel.text = "\(james.name) hand size: \(james.hand.size)"
        
        if warGame.gameOver() {
            
            flipCardButton.isHidden = true
        }
    }
}
