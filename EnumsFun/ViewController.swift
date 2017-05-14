//
//  ViewController.swift
//  EnumsFun
//
//  Created by Jim Campagno on 7/20/16.
//  Copyright © 2016 Gamesmith, LLC. All rights reserved.
//

import UIKit

//Finally, you'll have to implement the ViewController class. The IB outlets and actions have already been set up for you. The flipCard(_:) action should play one turn of War and update all the labels on the screen with the flipped cards, as well as the winner and loser of the round. It should also keep a running tally of the total number of cards left in each player's deck. The exact implementation of this class is open to you, but you should make use of the IB outlets and actions that have already been created.

class ViewController: UIViewController {
    @IBOutlet weak var opponentCardLabel: UILabel!
    @IBOutlet weak var playerCardLabel: UILabel!
    @IBOutlet weak var winnerLabel: UILabel!
    @IBOutlet weak var playerScoreLabel: UILabel!
    @IBOutlet weak var opponentScoreLabel: UILabel!
    @IBOutlet weak var flipCardButton: UIButton!
    
    var game = GameEngine(player1: "You", player2: "Opponent")
    
    @IBAction func flipCard(_ sender: UIButton) {
        if !game.gameOver() {
            let (winner, card1, card2) = game.playOneTurn()
            if let card1 = card1 {
                playerCardLabel.text = card1.description
            } else {
                playerCardLabel.text = "Nothing"
            }
            if let card2 = card2 {
                opponentCardLabel.text = card2.description
            } else {
                opponentCardLabel.text = card2?.description
            }
            winnerLabel.text = "\(winner.name) won!"
            playerScoreLabel.text = "You: \(game.player1.hand.size)"
            opponentScoreLabel.text = "Opponent: \(game.player2.hand.size)"
        }
    }
    
   
    
}
