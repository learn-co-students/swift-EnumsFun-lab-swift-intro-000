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
    
    let game = GameEngine(player1: "Morgan", player2: "Ruth")
    var p1: Player { return game.player1 }
    var p2: Player { return game.player2 }
    
    @IBAction func flipCard(_ sender: UIButton) {
        let (winner, p1Card, p2Card) = game.playOneTurn()
        guard let p1Text = p1Card?.description, let p2Text = p2Card?.description else { return }
        playerCardLabel.text = p1Text
        opponentCardLabel.text = p2Text
    
        winnerLabel.text = winner.name
        
        updateScores()
        isGameOver()
    }
    
    func updateScores() {
        playerScoreLabel.text = "\(p1.name)'s Hand Size: \(p1.hand.cards.count)"
        opponentScoreLabel.text = "\(p2.name)'s Hand Size: \(p2.hand.cards.count)"
    }
    
    func isGameOver() {
        if game.gameOver() {
            flipCardButton.isEnabled = false
        }
    }
}
