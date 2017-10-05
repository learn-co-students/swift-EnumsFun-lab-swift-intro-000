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
    

    var gameEngine = GameEngine(player1: "Koi", player2: "Emma");

    
    @IBAction func flipCard(_ sender: UIButton) {
        let results = gameEngine.playOneTurn();
        
        opponentCardLabel.text = results.2?.description;
        playerCardLabel.text = results.1?.description;
        winnerLabel.text = results.0.name;
        if(results.0.name == "Koi") {
            let score = Int(playerScoreLabel.text!);
            playerScoreLabel.text = String(score! + 1);
        } else {
            let score = Int(opponentScoreLabel.text!);
            opponentScoreLabel.text = String(score! + 1);
        }
    }
    
   
    
}
