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
    
    var game: GameEngine = GameEngine(player1: "player", player2: "opponent")

    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func flipCard(_ sender: UIButton) {
        game = GameEngine(player1: "player", player2: "opponent")
        //let gameResults = game.playOneTurn()
        // award amount to winning player and subtract amount from losing player
        //implement conditions for game over
//        opponentCardLabel.text = gameResults.2!.description
//        playerCardLabel.text = gameResults.1!.description
//        winnerLabel.text = gameResults.0.name
//        playerScoreLabel.text = String(gameResults.1!.rank.rawValue)
//        opponentScoreLabel.text = String(gameResults.2!.rank.rawValue)
        
        let gameResults = game.playRound()
        var cardsAwarded = gameResults.1
        var winner = gameResults.0!

        game.award(cards: cardsAwarded, to: winner)
        
        let indexOppCard = gameResults.1.count - 1
        let indexPlayerCard = gameResults.1.count - 2
        opponentCardLabel.text = gameResults.1[indexOppCard]!.description
        playerCardLabel.text = gameResults.1[indexPlayerCard]!.description
        winnerLabel.text = winner.name
        opponentScoreLabel.text = String(gameResults.1[indexOppCard]!.rank.rawValue)
        playerScoreLabel.text = String(gameResults.1[indexPlayerCard]!.rank.rawValue)
    }

}
