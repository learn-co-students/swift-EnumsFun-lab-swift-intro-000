//
//  GameEngine.swift
//  EnumsFun
//
//  Created by Michael Dippery on 8/2/16.
//  Copyright © 2016 Gamesmith, LLC. All rights reserved.
//

import Foundation

//Next, open up GameEngine.swift. There is a GameEngine class defined in this file that implements the logic for a game of War.
//Add a property called player1 of type Player to GameEngine.
//Add a property called player2 of type Player.
//Add a property called deck of type Deck.
//Create an initializer for GameEngine that takes two Player parameters called player1 and player2, both of type String, representing the names of the game's players. This initializer should create a deck of cards and split it in half, then create two Player instances and assign them to the appropriate property.
//Implement a method called playOneTurn() that returns a three-element tuple of type (Player, Card?, Card?), representing the winning player of this turn, the card that player1 flipped over, and the card that player2 flipped over. This method should flip cards for each player. Remember, the player with the highest card wins!
//Implement a method called award(cards:to:). This methods first parameter is called cards of type [Card]. The second parameter should be called player of type Player. It should give the player all of the cards. (Hint: Don't forget about the give(card:) method you implemented on the Player class.)
//Implement a method called gameOver() that returns true when the game is over. (The game is over when either player has run out of cards.)

class GameEngine {
    var player1: Player
    var player2: Player
    var deck: Deck
    init(player1: String, player2: String) {
        deck = Deck()
        let halves = deck.split()
        
        self.player1 = Player(name: player1, hand: Hand(cards: halves.0))
        self.player2 = Player(name: player2, hand: Hand(cards: halves.1))
    }

    func playOneTurn() -> (Player, Card?, Card?) {
        guard player1.hasCards() else { return (player2, nil, nil) }
        guard player2.hasCards() else { return (player1, nil, nil) }
        let card1 = player1.flip()!
        let card2 = player2.flip()!
        
        if card1.rank.rawValue > card2.rank.rawValue {
            award(cards: [card1, card2], to: player1)
            return (player1, card1, card2)
        } else {
            award(cards: [card1, card2], to: player2)
            return (player2, card1, card2)
        }
    }
    
    func award(cards: [Card], to player: Player) {
        for card in cards {
            player.give(card: card)
        }
    }
    func gameOver() -> Bool {
        return !player1.hasCards() || !player2.hasCards()
    }
    
}


