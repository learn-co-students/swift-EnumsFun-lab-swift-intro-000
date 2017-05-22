//
//  GameEngine.swift
//  EnumsFun
//
//  Created by Michael Dippery on 8/2/16.
//  Copyright © 2016 Gamesmith, LLC. All rights reserved.
//

import Foundation

class GameEngine {
    
    let player1: Player
    let player2: Player
    let deck = Deck()
    
    init(player1: String, player2: String) {
        let splittedDeck = deck.split()
        self.player1 = Player(name: player1, hand: Hand(cards: splittedDeck.0))
        self.player2 = Player(name: player2, hand: Hand(cards: splittedDeck.1))
    }
    
    func playOneTurn() -> (Player, Card?, Card?) {
        guard let p1Card = player1.flip() else { return (player2, nil, nil) }
        guard let p2Card = player2.flip() else { return (player1, nil, nil) }

        if p1Card.rank.rawValue == p2Card.rank.rawValue {
            award(cards: [p1Card, p2Card], to: player1)
            return (player1, p1Card, p2Card)
        } else if p1Card.rank.rawValue > p2Card.rank.rawValue {
            award(cards: [p1Card, p2Card], to: player1)
            return (player1, p1Card, p2Card)
        } else {
                award(cards: [p1Card, p2Card], to: player2)
            return (player2, p2Card, p1Card)
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


