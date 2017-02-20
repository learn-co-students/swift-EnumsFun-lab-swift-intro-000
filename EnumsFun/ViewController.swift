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
    
    let warGame = GameEngine(player1: "Harry", player2: "Voldemort")
    
    var harry: Player {
        return warGame.player1
    }
    
    var voldemort: Player {
        return warGame.player2
    }
    
    @IBAction func flipCard(_ sender: UIButton) {
        let (winner, harryCard, voldemortCard) = warGame.playOneTurn()
        
        if let harryCard = harryCard {
            playerCardLabel.text = harryCard.description
        }
        
        if let voldemortCard = voldemortCard {
            opponentCardLabel.text = voldemortCard.description
        }
        
        winnerLabel.text = "\(winner.name) won round!"
        
        updateScores()
        checkForGameOver()
        
    }
    
    func updateScores() {
        playerScoreLabel.text = "Harry Score: \(String(harry.hand.size))"
        opponentScoreLabel.text = "Voldemort Score: \(String(voldemort.hand.size))"
    }
    
    func checkForGameOver() {
        let (winner, _, _) = warGame.playOneTurn()
        if warGame.gameOver() {
            winnerLabel.text = "Game over, \(winner.name) has won!"
            flipCardButton.isHidden = true
        }
    }
    
   
    
}
