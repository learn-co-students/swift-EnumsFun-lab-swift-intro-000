//
//  ViewController.swift
//  EnumsFun
//
//  Created by Jim Campagno on 7/20/16.
//  Copyright © 2016 Gamesmith, LLC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var gameEngine = GameEngine()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBOutlet weak var opponentCardLabel: UILabel!
    @IBOutlet weak var playerCardLabel: UILabel!
    @IBOutlet weak var winnerLabel: UILabel!
    @IBOutlet weak var playerScoreLabel: UILabel!
    @IBOutlet weak var opponentScoreLabel: UILabel!
    @IBOutlet weak var flipCardButton: UIButton!
    
    
    @IBAction func flipCard(_ sender: UIButton) {
        var result = gameEngine.playOneTurn()
        if gameEngine.gameOver() {
            gameEngine.playOneTurn()
        } else {
        var playerCard = result.1
        var oppCard = result.2
        var winner = result.0
        if let firstCard = playerCard {
            if let secondCard = oppCard {
                gameEngine.award(cards: [firstCard,secondCard], winningPlayer: winner)
            }
        }
        playerCardLabel.text = playerCard?.description
        opponentCardLabel.text = oppCard?.description
        winnerLabel.text = "The winner is \(winner.name)"
        
        playerScoreLabel.text = "\(gameEngine.player1.name): \(String(gameEngine.player1.hand.size))"
        opponentScoreLabel.text =  "CPU: \(String(gameEngine.player2.hand.size))"
    
    }
    
    }
   
    
}
