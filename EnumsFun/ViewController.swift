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
    @IBOutlet weak var playerCardTracker: UILabel!
    @IBOutlet weak var opponentCardTracker: UILabel!
    
    var game: GameEngine = GameEngine(player1: "player", player2: "opponent")
    var player: Player {
        return game.player2
    }
    var opponent: Player {
        return game.player1
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func updateGameOver() {
        if game.gameOver() {
            flipCardButton.isEnabled = false
            if player.hasCards() {
                winnerLabel.text = "\(player.name) wins the game!"
            } else {
                winnerLabel.text = "\(opponent.name) wins the game!"
            }
        }
    }
    
    @IBAction func flipCard(_ sender: UIButton) {
        
//        let gameResults = game.playOneTurn()
//        opponentCardLabel.text = gameResults.2!.description
//        playerCardLabel.text = gameResults.1!.description
//        winnerLabel.text = gameResults.0.name
//        playerScoreLabel.text = String(gameResults.1!.rank.rawValue)
//        opponentScoreLabel.text = String(gameResults.2!.rank.rawValue)
        
        let gameResults = game.playRound()
        var winner = gameResults.0!
        
        let indexOppCard = gameResults.1.count - 2
        let indexPlayerCard = gameResults.1.count - 1
        opponentCardLabel.text = gameResults.1[indexOppCard]!.description
        playerCardLabel.text = gameResults.1[indexPlayerCard]!.description
        winnerLabel.text = winner.name + " wins the hand"
        opponentScoreLabel.text = "Opponent: " + String(gameResults.1[indexOppCard]!.rank.rawValue)
        playerScoreLabel.text = "You:" + String(gameResults.1[indexPlayerCard]!.rank.rawValue)
        playerCardTracker.text = "Cards in your hand: " + String(player.hand.size)
        opponentCardTracker.text = "Cards in opponent's hand: " + String(opponent.hand.size)
        
        updateGameOver()
    }

}
