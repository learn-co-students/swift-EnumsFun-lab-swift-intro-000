//
//  ViewController.swift
//  EnumsFun
//
//  Created by Jim Campagno on 7/20/16.
//  Copyright © 2016 Gamesmith, LLC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  let gameEngine = GameEngine(player1: "Harry", player2: "Alexander")
  
  @IBOutlet weak var opponentCardLabel: UILabel!
  @IBOutlet weak var playerCardLabel: UILabel!
  @IBOutlet weak var winnerLabel: UILabel!
  @IBOutlet weak var playerScoreLabel: UILabel!
  @IBOutlet weak var opponentScoreLabel: UILabel!
  @IBOutlet weak var flipCardButton: UIButton!
  
  
  
  @IBAction func flipCard(_ sender: UIButton) {
    let game = gameEngine.playOneTurn()
    
    opponentCardLabel.text = game.2?.description
    playerCardLabel.text = game.1?.description
    
    if gameEngine.player1.name == game.0.name {
      
    }
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
}
