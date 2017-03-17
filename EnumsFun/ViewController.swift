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
    
    let warGame = GameEngine(player1: "Bilbo", player2: "Frodo")
    
    var bilbo: Player {
        return warGame.player1
    }
    
    var frodo: Player {
        return warGame.player2
    }
    
    
    @IBAction func flipCard(_ sender: UIButton) {
        let (winner, bilboCard, frodoCard) = warGame.playOneTurn()
        
        if let bilboCard = bilboCard {
            playerCardLabel.text = bilboCard.description
        }
        
        if let frodoCard = frodoCard {
            opponentCardLabel.text = frodoCard.description
        }
        
        winnerLabel.text = winner.name
        
        playerScoreLabel.text = String(bilbo.hand.size)
        opponentScoreLabel.text = String(frodo.hand.size)
    }
    
   
    
}
