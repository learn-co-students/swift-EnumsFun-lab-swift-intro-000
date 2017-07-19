//
//  GameEngine.swift
//  EnumsFun
//
//  Created by Michael Dippery on 8/2/16.
//  Copyright © 2016 Gamesmith, LLC. All rights reserved.
//

import Foundation

class GameEngine {
    var player1: Player
    var player2: Player
    var deck: Deck
    var draw = 0
    
    init(player1: String, player2: String) {
        self.deck = Deck()
        let decks: (deck1: [Card], deck2: [Card]) = deck.split()
        self.player1 = Player(name: player1, hand: Hand(cards: decks.deck1))
        self.player2 = Player(name: player2, hand: Hand(cards: decks.deck2))
    }
    
    func playOneTurn() -> (Player, Card?, Card?) {
        var card1: Card
        var card2: Card
        draw = 0
        
        if player1.hasCards() && player2.hasCards() {
            card1 = player1.flip()!
            card2 = player2.flip()!
            if card1.rank.rawValue > card2.rank.rawValue {
                return (player1, card1, card2)
            } else if card1.rank.rawValue < card2.rank.rawValue {
                return (player2, card1, card2)
            } else if card1.rank.rawValue == card2.rank.rawValue {
                player1.give(card: card1)
                player2.give(card: card2)
                draw = 1
                return (player1, card1, card2)
            }
        }
        
        if player1.hasCards() && !player2.hasCards() {
            card1 = player1.flip()!
            player1.give(card: card1)
            return (player1, nil, nil)
        }
        
        if !player1.hasCards() && player2.hasCards() {
            card2 = player2.flip()!
            player2.give(card: card2)
            return (player2, nil, nil)
        }
        
        return (player1, nil, nil)

    }
    
    func award(cards: [Card], to: Player) {
        for card in cards {
            to.give(card: card)
        }
    }
    
    func gameOver() -> Bool {
        if self.player1.hand.size == 0 || self.player2.hand.size == 0 {
            return true
        }
        return false
    }
}


