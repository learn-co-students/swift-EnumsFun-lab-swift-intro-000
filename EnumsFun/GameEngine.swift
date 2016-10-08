//
//  GameEngine.swift
//  EnumsFun
//
//  Created by Michael Dippery on 8/2/16.
//  Copyright © 2016 Gamesmith, LLC. All rights reserved.
//

import Foundation

class GameEngine {
    //Add a property called player1 of type Player to GameEngine.
    var player1: Player
    //Add a property called player2 of type Player.
    var player2: Player
    //Add a property called deck of type Deck.
    let deck: Deck
    
    //Create an initializer for GameEngine that takes two Player parameters called player1 and player2, both of type String, representing the names of the game's players. This initializer should create a deck of cards and split it in half, then create two Player instances and assign them to the appropriate property.
    init (player1: String, player2: String) {
        //create a deck of cards & split it in half
        self.deck = Deck()
        let (firstHalf, secondHalf) = self.deck.split()
        let hand1 = Hand(cards: firstHalf)
        //hand is an array of cards
        let hand2 = Hand(cards: secondHalf)
        //create 2 player instances & assign them half their decks; make sure to put self here!
        self.player1 = Player(name: player1, hand: hand1)
        self.player2 = Player(name: player2, hand: hand2)
    }
    
    //Implement a method called playOneTurn() that returns a three-element tuple of type (Player, Card?, Card?), representing the winning player of this turn, the card that player1 flipped over, and the card that player2 flipped over. This method should flip cards for each player. Remember, the player with the highest card wins!
    func playOneTurn() -> (Player, Card?, Card?) {
        //winning player / player1 card / player2 card
        //if both players have cards
        var result: (Player, Card?, Card?) = (player1, nil, nil)
        if player1.hasCards() && player2.hasCards() {
            let player1Card = player1.flip()
            let player2Card = player2.flip()
            if (player1Card?.rank.rawValue)! > (player2Card?.rank.rawValue)! {
                //this gives both of the cards to the winner
                award(cards: [player1Card!, player2Card!], to: player1)
                result = (player1, player1Card, player2Card)
            } else if (player2Card?.rank.rawValue)! > (player1Card?.rank.rawValue)! {
                award(cards: [player1Card!, player2Card!], to: player2)
                result = (player1, player1Card, player2Card)
            }
        }
        if player1.hasCards() && !player2.hasCards() {
            result = (player1, nil, nil)
        }
        if player2.hasCards() && !player1.hasCards() {
            result = (player2, nil, nil)
        }
        return result
    }
    
    //Implement a method called award(cards:to:). This methods first parameter is called cards of type [Card]. The second parameter should be called player of type player. It should give the player all of the cards. (Hint: Don't forget about the give(card:) method you implemented on the Player class.)
    func award(cards: [Card],to player: Player) {
        for card in cards {
            player.giveCard(toBottomOfHand: card)
        }
    }
    
    //Implement a method called gameOver() that returns true when the game is over. (The game is over when either player has run out of cards.)
    func gameOver() -> Bool {
        if !player1.hasCards() || !player2.hasCards() {
            return true
        }
        return false
    }
    
    
}



