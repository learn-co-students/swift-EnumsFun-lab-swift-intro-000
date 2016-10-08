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

    //creates an instance of a game engine
    var game: GameEngine!
    
    //create player
    var me: Player {
        return game.player2
    }
    
    //create opponent
    var opponent: Player {
        return game.player1
    }
    
    override func viewDidLoad() {
        //initialize the game with the player names
        game = GameEngine(player1: "opponent", player2: "me")
        //update the game labels with how many cards each player has
        opponentCardLabel.text = "\(opponent.hand.size)"
        playerScoreLabel.text = "\(me.hand.size)"
    }
    
    @IBAction func flipCard(_ sender: UIButton) {
        //create an instance of the game's function playOneTurn
        //player1Card = opponent
        //player2Card = me
        var (winner, player1Card, player2Card) = game.playOneTurn()
        
        //updates the winner label
        if winner.name == "me" {
            winnerLabel.text = "I'm the winner"
        } else {
            winnerLabel.text = "Opponent is the winner"
        }
        
        //assigns the label texts to the winning card rank/value descriptions (the cards that were played)
        playerCardLabel.text = player1Card?.description
        opponentCardLabel.text = player2Card?.description
        
        //update the game labels with the score (how many cards each player has)
        opponentScoreLabel.text = "\(opponent.hand.size)"
        playerScoreLabel.text = "\(me.hand.size)"
        
     }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}
