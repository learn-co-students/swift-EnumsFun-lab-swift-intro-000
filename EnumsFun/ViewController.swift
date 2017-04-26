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
    
    
    var game = GameEngine(player1: "Player 1", player2: "Computer")
    var winner: Player?

    
    @IBAction func flipCard(_ sender: UIButton) {
        if !game.gameOver(){
            let result = game.playOneTurn( )
            
            winner = result.0
        
            opponentCardLabel.text = result.2!.description
            playerCardLabel.text = result.1!.description
        
        	let winnings = [result.1!, result.2!]
        	game.award(cards: winnings, to: result.0)
            
            updateScores( )
        }
        else{
            game = GameEngine(player1: "Player 1", player2: "Computer")
            winner = nil
            
            updateScores( )
            
            opponentCardLabel.text = "?"
            playerCardLabel.text = "?"
            
            flipCardButton.titleLabel!.text = "Flip Card"
        }
    }
    
    func updateScores( ){
        if game.gameOver(){
            flipCardButton.titleLabel!.text = "Play Again"
        }
        
        if let winner = winner{
            winnerLabel.text = winner.name
        }
        else{
            winnerLabel.text = "?"
        }
        
        playerScoreLabel.text = "\(game.player1.name): \(game.player1.hand.cards.count)"
        opponentCardLabel.text = "\(game.player2.name): \(game.player2.hand.cards.count)"
    }
    
}
