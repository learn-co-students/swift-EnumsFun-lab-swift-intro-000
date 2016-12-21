//
//  ViewController.swift
//  EnumsFun
//
//  Created by Jim Campagno on 7/20/16.
//  Copyright © 2016 Gamesmith, LLC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let myGame = GameEngine(player1: "God Of War", player2: "The Four Horse Men")
    
    
    @IBOutlet weak var opponentCardLabel: UILabel!
    @IBOutlet weak var playerCardLabel: UILabel!
    @IBOutlet weak var winnerLabel: UILabel!
    @IBOutlet weak var playerScoreLabel: UILabel!
    @IBOutlet weak var opponentScoreLabel: UILabel!
    
    @IBOutlet weak var gameOverLabel: UILabel!
    
    @IBOutlet weak var flipCardButton: UIButton!
    var player1Count: Int = 0
    var player2Count: Int = 0
    
    func runGame(){
        
        let warResults = myGame.playOneTurn()
       
            let card1 = warResults.1?.description
            playerCardLabel.text = card1
      
            let card2 = warResults.2?.description
            opponentCardLabel.text = card2
            
            winnerLabel.text = warResults.0.name
    
            if warResults.0.name == myGame.player1.name {
                player1Count += 1
                playerScoreLabel.text = String(player1Count)
            }
            else {
                
                player2Count += 1
                opponentScoreLabel.text = String(player2Count)
            }
        
        }
    

    @IBAction func flipCard(_ sender: UIButton) {
        runGame()
           }
    override func viewDidLoad() {
        
    }
    
}

