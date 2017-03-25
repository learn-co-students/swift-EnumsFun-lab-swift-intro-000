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
        self.deck = Deck.init()
        let cardDeck = self.deck.split()

        self.player1 = Player.init(name: player1, hand: Hand.init(cards: cardDeck.0))
        self.player2 = Player.init(name: player2, hand: Hand.init(cards: cardDeck.1))
    }
    
    func playOneTurn() -> (Player, Card?, Card?) {
        guard player1.hasCards() else { return (player2, nil, nil) }
        guard player2.hasCards() else { return (player1, nil, nil) }
        
        let p1Card = player1.flip()!
        let p2card = player2.flip()!
        let cards = [p1Card, p2card]
        
        if p1Card.rank.rawValue > p2card.rank.rawValue {
            award(cards: cards, to: player1)
            return (player1, p1Card, p2card)
        } else {
            award(cards: cards, to: player2)
            return (player2, p1Card, p2card)
        }
    }
    
    func award(cards: [Card], to: Player) {
        for card in cards {
            to.give(card: card)
        }
    }
    
    func gameOver() -> Bool {
        return !player1.hasCards() || !player2.hasCards()
    }
}


