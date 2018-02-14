//
//  GameEngine.swift
//  EnumsFun
//
//  Created by Michael Dippery on 8/2/16.
//  Copyright © 2016 Gamesmith, LLC. All rights reserved.
//

import Foundation

class GameEngine {
    //initializers
    init(player1: String, player2: String) {
        //first create a deck, split in half, and add the halves to the players
        deck = Deck()
        let halves = deck.split()
        self.player1 = Player(name: player1, hand: Hand(cards: halves.0)) //need to initialize hand with method from the Hand class
        self.player2 = Player(name: player2, hand: Hand(cards: halves.1))
    }

    
    //stored properties
    var player1: Player
    var player2: Player
    var deck: Deck

    func playoneTurn()-> (Player, Card?, Card?) {
        let card1 = player1.flip()!
        let card2 = player2.flip()!//exlamation mark = force unwrap?
        
        //check who won
        if card1.rank.rawValue > card2.rank.rawValue {
            award(cards: [card1, card2], to: player1)
            return (player1, card1, card2)
        }else {
            award(cards: [card1, card2], to: player2)
            return (player2, card1, card2)
        }
    }
    
    func award(cards: [Card], to player: Player) { //input is an array of cards, for instance card1, card2, which is then given to the player specified
        for card in cards {
            player.giveCard(card: card)
        }
    }
    func gameOver() -> Bool {
        return !player1.hasCards() || !player2.hasCards()
    }
}


