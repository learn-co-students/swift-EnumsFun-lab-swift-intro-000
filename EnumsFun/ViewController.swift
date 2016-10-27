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
    
    var ge =  GameEngine(player1:"Ramesh",player2:"Suresh")
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    


    @IBAction func flipCard(_ sender: UIButton) {
        
        if !ge.gameOver() {
            
            let outCome = ge.playOneTurn()
            
            opponentCardLabel.text = outCome.2?.description
            playerCardLabel.text = outCome.1?.description
            winnerLabel.text = outCome.0.name
            playerScoreLabel.text = String(describing: outCome.2?.rank.rawValue)
            opponentScoreLabel.text = String(describing: outCome.1?.rank.rawValue)
            
            
        }else {
            
            winnerLabel.text = "Game Over"
            
            
        }
        

        
    }
}
