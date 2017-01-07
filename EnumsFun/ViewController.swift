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

    @IBAction func flipCard(_ sender: UIButton) {
        
     let (winner, Card1, Card2) = gameEngine.playOneTurn()
     
        playerCardLabel.text = Card1?.description1
        opponentCardLabel.text = Card2?.description1
        winnerLabel.text = winner.name
        updateScores()
        //print("\(you.hand.cards[0].description1)")
        for i in you.hand.cards {
        print("\(i.description1)")
        }
        print("--------------------")
    }
    
    var gameEngine: GameEngine!
    var you: Player {
        return gameEngine.player1
    }
    var computer: Player {
        return gameEngine.player2
    }
    
    
    
    
    override func viewDidLoad() {
           // super.viewDidLoad()
        gameEngine = GameEngine(player1: "Juan", player2: "Computer")
        updateScores()
            
        }
    
    
  

    
    func updateScores() {
        
        playerScoreLabel.text = "You: \(you.hand.size)"
        opponentScoreLabel.text = "Opponent: \(computer.hand.size)"
    }
        
        
        
    
}
