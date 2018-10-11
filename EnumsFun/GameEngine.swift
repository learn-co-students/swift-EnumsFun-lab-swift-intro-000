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
    var deck = Deck()
    
    init(player1: String, player2: String) {
        let splitDeck = deck.split()
        let player1Hand = Hand(cards: splitDeck.0)
        let player2Hand = Hand(cards: splitDeck.1)
        self.player1 = Player(name: player1, hand: player1Hand)
        self.player2 = Player(name: player2, hand: player2Hand)
    }
    
    func playOneTurn() -> (Player, Card?, Card?) {
        guard player1.hasCards() else { return (player2, nil, nil) }
        guard player2.hasCards() else { return (player1, nil, nil) }
        
        let card1 = player1.flip()!
        let card2 = player2.flip()!
        let cards = [card1, card2]
        
        if card1.rank.rawValue > card2.rank.rawValue {
            award(cards: cards, to: player1)
            return (player1, card1, card2)
        } else {
            award(cards: cards, to: player2)
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


