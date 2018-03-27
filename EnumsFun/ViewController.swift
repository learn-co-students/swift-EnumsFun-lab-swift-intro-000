//
//  ViewController.swift
//  EnumsFun
//
//  Created by Jim Campagno on 7/20/16.
//  Copyright © 2016 Gamesmith, LLC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let gameStart = GameEngine(player1: "Opponent", player2: "You")
    
    @IBOutlet weak var opponentCardLabel: UILabel!
    @IBOutlet weak var playerCardLabel: UILabel!
    @IBOutlet weak var winnerLabel: UILabel!
    @IBOutlet weak var playerScoreLabel: UILabel!
    @IBOutlet weak var opponentScoreLabel: UILabel!
    @IBOutlet weak var flipCardButton: UIButton!
    @IBOutlet weak var youCardsLeft: UILabel!
    @IBOutlet weak var opponentCardsLeft: UILabel!
    
    @IBOutlet weak var gameOverLabel: UILabel!
    var yourScore:Int = 0
    var opponentScore:Int = 0
    @IBAction func flipCard(_ sender: UIButton) {
        
        if gameStart.gameOver() == false {
            let gameRountOne = gameStart.playOneTurn()
            opponentCardLabel.text = gameRountOne.1?.description
            playerCardLabel.text = gameRountOne.2?.description
            winnerLabel.text = "Winner is: \(gameRountOne.0.name)"
            
            if gameRountOne.0.name == "You" {
                yourScore+=1
                gameStart.player2.give(card: gameRountOne.1!)
                gameStart.player2.give(card: gameRountOne.2!)
                gameStart.player2.hand.cards.shuffle()
            } else if gameRountOne.0.name == "Opponent" {
                opponentScore+=1
                gameStart.player1.give(card: gameRountOne.1!)
                gameStart.player1.give(card: gameRountOne.2!)
                gameStart.player1.hand.cards.shuffle()
            }
            
            
            opponentScoreLabel.text = "Opponent Score: \(String(describing: opponentScore))"
            playerScoreLabel.text = "Your Score:\n \(String(describing: yourScore))"
            
            opponentCardsLeft.text = "CardsLeft:\n \(gameStart.player1.hand.size)"
            youCardsLeft.text = "CardsLeft:\n \(gameStart.player2.hand.size)"
        } else {
            if yourScore > opponentScore {
                gameOverLabel.text = "Game Over! YOU WIN!"
            } else {
                gameOverLabel.text = "Game Over! Your Opponent WINS!"
            }
        }
    }
    
}
