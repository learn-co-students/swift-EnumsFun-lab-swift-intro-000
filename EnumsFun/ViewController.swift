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
    
    let warGame = GameEngine(player1: "Harry", player2: "Voldemort")
    var harry: Player {
        return warGame.player1
    }
    var voldemort: Player {
        return warGame.player2
    }
    
    @IBAction func flipCard(_ sender: UIButton) {
     
        let (winner, harryCard, voldemortCard) = warGame.playOneTurn()
        
        if let harryCard = harryCard {
            playerCardLabel.text = harryCard.description
        }
        
        if let voldemortCard = voldemortCard {
            opponentCardLabel.text = voldemortCard.description
        }
        
        winnerLabel.text = "\(winner.name) has won"
        
        playerScoreLabel.text = "Harry Hand Size: \(harry.hand.size)"
        opponentCardLabel.text = "Voldemort Hand Size: \(voldemort.hand.size)"
        
    }
}
