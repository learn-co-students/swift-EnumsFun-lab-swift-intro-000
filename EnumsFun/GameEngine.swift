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
    
    init(player1: String, player2: String) {
        self.deck = Deck()
        let splitCards: ([Card], [Card]) = deck.split()
        self.player1 = Player(name: player1, hand: Hand(cards: splitCards.0))
        self.player2 = Player(name: player2, hand: Hand(cards: splitCards.1))
    }

    func playerOneTurn() -> (Player, Card?, Card?) {
        guard self.player1.hasCards() else {
            return (self.player2, nil, nil)
        }
        guard self.player2.hasCards() else {
            return (self.player1, nil, nil)
        }
        
        let player1Card = player1.flip()!
        let player2Card = player2.flip()!
        
        if player1Card.rank.rawValue > player2Card.rank.rawValue {
            self.award(cards: [player1Card, player2Card], to: self.player1)
            return (self.player1, player1Card, player2Card)
        } else {
            self.award(cards: [player1Card, player2Card], to: self.player2)
            return (self.player2, player1Card, player2Card)
        }
    }
    
    func award(cards: [Card], to player: Player) {
        for card in cards {
            player.give(card: card)
        }
    }
    
    func gameOver() -> Bool {
        if !player1.hasCards() || !player2.hasCards() {
            return true
        }
        return false
    }
}


