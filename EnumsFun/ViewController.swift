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
    
    let warGame = GameEngine(player1: "Kratos", player2: "Aries")
    
    var kratos: Player{
        return warGame.player1
    }
    
    var aries: Player{
        return warGame.player2
    }
    
    
    @IBAction func flipCard(_ sender: UIButton) {
        
        let (winner, kratosCard, ariesCard) = warGame.playOneTurn()
        
        if let kratosCard = kratosCard {
            playerCardLabel.text = kratosCard.description
        }
        
        if let ariesCard = ariesCard {
            opponentCardLabel.text = ariesCard.description
        }
          winnerLabel.text = winner.name
        
        updateScore()
        checkForEndOfGame()

    }
    
    func updateScore() {
      
        playerScoreLabel.text = String(kratos.hand.size)
        opponentScoreLabel.text = String(aries.hand.size)
    }
    
    func checkForEndOfGame() {
        if warGame.gameOver() {
            flipCardButton.isHidden = true
        }
    }
    
    
   
    
}
