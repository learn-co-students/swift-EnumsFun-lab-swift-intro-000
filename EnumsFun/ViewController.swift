//
//  ViewController.swift
//  EnumsFun
//
//  Created by Jim Campagno on 7/20/16.
//  Copyright © 2016 Gamesmith, LLC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var gameEngine: GameEngine!
    var you: Player {
        return gameEngine.player1
    }
    var opponent: Player {
        return gameEngine.player2
    }
    
    override func viewDidLoad() {
        gameEngine = GameEngine(player1: "You", player2: "Opponent")
        updateScores()
    }
    
    @IBOutlet weak var opponentCardLabel: UILabel!
    @IBOutlet weak var playerCardLabel: UILabel!
    @IBOutlet weak var winnerLabel: UILabel!
    @IBOutlet weak var playerScoreLabel: UILabel!
    @IBOutlet weak var opponentScoreLabel: UILabel!
    @IBOutlet weak var flipCardButton: UIButton!
    
    @IBAction func flipCard(_ sender: UIButton) {
        let (winner, youCard, opponentCard) = gameEngine.playerOneTurn()
        if let youCard = youCard {
            playerCardLabel.text = youCard.description
        }
        if let opponentCard = opponentCard {
            opponentCardLabel.text = opponentCard.description
        }
        winnerLabel.text = winner.name
        updateScores()
    }
    
    func updateScores() {
        playerScoreLabel.text = String(you.hand.size)
        opponentScoreLabel.text = String(opponent.hand.size)
    }
    
    func checkGameOver() {
        if gameEngine.gameOver() {
            flipCardButton.isEnabled = false
        }
    }
    
}
