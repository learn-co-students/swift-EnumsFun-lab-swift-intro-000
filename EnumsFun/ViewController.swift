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
    
    var game = GameEngine(player1name: "You", player2name: "Computer")
    
    @IBAction func flipCard(_ sender: UIButton) {
        let turn = game.playOneTurn()
        winnerLabel.text = "/(String(turn.0.name) wins!"
        playerCardLabel.text = "/(String(turn.1.description)"
        opponentCardLabel.text = "/(String(turn.2.description)"
        playerScoreLabel.text = "You: /(String(game.player1.hands.cards.count))"
        opponentScoreLabel.text = "Computer: /(game.player2.hands.cards.count))"
        
    }
    
   
    
}
