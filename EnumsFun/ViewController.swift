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

    var gameEngine:GameEngine!
    var you:Player{
        return gameEngine.player2
    }
    var opponent:Player{
        return gameEngine.player1
    }

    override func viewDidLoad() {
        gameEngine = GameEngine(playerName1: "you", playerName2: "opponent")
        playerScoreLabel.text = "You: \(you.hand.size)"
        opponentScoreLabel.text = "Opponent: \(opponent.hand.size)"
    }

    
    @IBAction func flipCard(_ sender: UIButton) {
        let (winner,card1,card2) = gameEngine.playOneTurn()
        playerCardLabel.text = "\(card1?.rank.stringValue)\(card1?.suit.rawValue)"
        opponentCardLabel.text = "\(card2?.rank.stringValue)\(card2?.suit.rawValue)"
        if(winner.name == "you"){
            playerScoreLabel.text = "You: \(winner.hand.size)"
            winnerLabel.text = "You win!"
        }else{
            opponentScoreLabel.text = "Opponent: \(opponent.hand.size)"
            winnerLabel.text = "Opponent win!"
        }
    }
    
   
    
}
