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
    @IBOutlet weak var p1CardLeft: UILabel!
    @IBOutlet weak var p2CardsLeft: UILabel!
    @IBOutlet weak var flipCardButton: UIButton!

    var newGame = GameEngine(player1: "You", player2: "Opponent")
    var p1score = 0
    var p2score = 0
    var tieCards = false
    
    override func viewDidLoad() {
        winnerLabel.text = ""
    }
    
    func printGameInfo(_ p1Card: Card?, _ p2Card: Card?) {
        print("\nPlayer: \(newGame.player1.name) \nHand Size: \(newGame.player1.hand.size)")
        if let p1 = p1Card {
            print("Card played: \(p1.description)")
        } else {
            print("Card played: NONE. value was nil")
        }
        
        print("\nPlayer: \(newGame.player2.name) \nHand Size: \(newGame.player2.hand.size)")
        if let p2 = p2Card {
            print("Card played: \(p2.description)")
        } else {
            print("Card played: NONE. value was nil")
        }
        
        print("\nTie: \(tieCards)")
        print("End turn sequence \n\n")
    }
    
    func previousHandTied(player: Player) {
        for card in newGame.cardPool {
            newGame.award(card: [card], player: player)
        }
        newGame.cardPool.removeAll()
        tieCards = false
    }
    
    @IBAction func flipCard(_ sender: UIButton) {
        let (winner, p1card, p2card) = newGame.playOneTurn()
        opponentCardLabel.text = p2card?.description
        playerCardLabel.text = p1card?.description
        
        if winner.name == "You" {
            winnerLabel.text = "\(winner.name) won!"
            p1score += 1
            playerScoreLabel.text = "\(newGame.player1.name): \(p1score)"
            
            // Award both cards to the winner
            if p2card != nil {
                newGame.award(card: [p2card!], player: newGame.player1)
            }
            if p1card != nil {
                newGame.award(card: [p1card!], player: newGame.player1)
            }
            
            // Handle case where last hand was tied
            if tieCards {
                previousHandTied(player: newGame.player1)
            }
        } else if winner.name == "Opponent" {
            winnerLabel.text = "\(winner.name) wins!"
            p2score += 1
            opponentScoreLabel.text = "\(newGame.player2.name): \(p2score)"
            
            // Award both cards to the winner
            if p1card != nil {
                newGame.award(card: [p1card!], player: newGame.player2)
            }
            if p2card != nil {
                newGame.award(card: [p2card!], player: newGame.player2)
            }
            
            // Handle case where last hand was tied
            if tieCards {
                previousHandTied(player: newGame.player2)
            }
        } else {
            // Tie
            winnerLabel.text = "TIE! WAR!"
            tieCards = true
        }
        
        if newGame.gameOver() {
            let p1Size = newGame.player1.hand.size
            let p2Size = newGame.player2.hand.size
            if  p1Size > p2Size {
                winnerLabel.text = "\(newGame.player1.name) won the game!"
                previousHandTied(player: newGame.player1)
            } else {
                winnerLabel.text = "\(newGame.player2.name) won the game!"
                previousHandTied(player: newGame.player2)
            }
            flipCardButton.setTitle("Game Over", for: .normal)
            flipCardButton.isEnabled = false
        }
        
        p1CardLeft.text = "\(newGame.player1.hand.size)"
        p2CardsLeft.text = "\(newGame.player2.hand.size)"
        
        printGameInfo(p1card, p2card)
    }
}
