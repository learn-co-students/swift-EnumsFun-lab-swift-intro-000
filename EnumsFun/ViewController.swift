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
     
    }
    
   
    
}

/*
 Finally, you'll have to implement the ViewController class. The IB outlets and actions have already been set up for you. The flipCard(_:) action should play one turn of War and update all the labels on the screen with the flipped cards, as well as the winner and loser of the round. It should also keep a running tally of the total number of cards left in each player's deck. The exact implementation of this class is open to you, but you should make use of the IB outlets and actions that have already been created.
 */

