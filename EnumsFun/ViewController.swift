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
    
    var game: GameEngine = GameEngine(player1: "Zhe", player2: "Ling")
    var p1score = 0
    var p2score = 0
    
    @IBAction func flipCard(_ sender: UIButton) {
        play()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func play() {
        if game.gameOver() {
            winnerLabel.text = "Game Over"
        }
        
        if !game.gameOver() {
            let win: (winner: Player, card1: Card?, card2: Card?) = game.playOneTurn()
            
            if game.draw == 1 {
                winnerLabel.text = "Draw"
                opponentCardLabel.text = win.card2?.description
                playerCardLabel.text = win.card1?.description
            }
            
            if game.draw == 0 {
                winnerLabel.text = win.winner.name
                opponentCardLabel.text = win.card2?.description
                playerCardLabel.text = win.card1?.description
                if win.winner.name == "Zhe" {
                    p1score += 1
                } else {
                    p2score += 1
                }
                playerScoreLabel.text = String(p1score)
                opponentScoreLabel.text = String(p2score)
            }
        }
    }
    
}
