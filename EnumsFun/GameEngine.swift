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
        let splitDeck = self.deck.split()
        self.player1 = Player(name: player1, hand: Hand(cards: splitDeck.0))
        self.player2 = Player(name: player2, hand: Hand(cards: splitDeck.1))
    }
    
    func playOneTurn() -> (Player?, Card?, Card?) {
        
        var p1card: Card
        var p2card: Card
        
        if player1.hasCards() && player2.hasCards() {
            p1card = player1.flip()!
            p2card = player2.flip()!
            
            if p1card.rank.rawValue > p2card.rank.rawValue {
                return (player1, p1card, p2card)
            } else if p1card.rank.rawValue == p2card.rank.rawValue {
                return (nil, p1card, p2card)
            } else {
                return (player2, p1card, p2card)
            }
            
        } else if player1.hasCards() && !player2.hasCards() {
            return (player1, nil, nil)
        } else if !player1.hasCards() && player2.hasCards() {
            return (player2, nil, nil)
        } else {
            return (player2, nil, nil)
        }
        
    }
    
    func award(cards: [Card], to player: Player) {
        for card in cards {
            player.hand.give(card: card)
        }
    }
    
    func gameOver() -> Bool {
        if !player1.hasCards() {
            return true
        } else if !player2.hasCards() {
            return true
        } else {
            return false
        }
    }
    
}


