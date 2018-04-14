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
        deck = Deck()
        var deckHalves = deck.split()
        var hand1 = Hand(cards: deckHalves.0)
        var hand2 = Hand(cards: deckHalves.1)
        self.player1 = Player(name: player1, hand: hand1)
        self.player2 = Player(name: player2, hand: hand2)
    }

    func playOneTurn() -> (Player, Card?, Card?) {
        var card1 = player1.flip()
        var card2 = player2.flip()
        var winner: Player

        if let c1 = card1, let c2 = card2 {
            winner = c1.rank.rawValue > c2.rank.rawValue ? player1 : player2
        } else if card1 != nil {
            winner = player1
            card1 = nil
        } else {
            winner = player2
            card2 = nil
        }
        return (winner, card1, card2)
    }
    
    func playRound() -> (Player?, [Card?]) {
        var card1 = player1.flip()
        var card2 = player2.flip()
        var winner: Player?
        var winTieBreaker: (Player?, [Card?])?
        
        if let c1 = card1, let c2 = card2 {
            if c1.rank.rawValue == c2.rank.rawValue {
                winTieBreaker = playTieBreaker(cards: [c1, c2])
            } else {
                if c1.rank.rawValue > c2.rank.rawValue {
                    winner = player1
                    award(cards: [c1, c2], to: player1)
                } else {
                    winner = player2
                    award(cards: [c1, c2], to: player2)
                }
            }
        } else if card1 != nil {
            winner = player1
            card2 = nil
        } else if card2 != nil {
            winner = player2
            card1 = nil
        } else {
            winner = nil
        }
        
        if let tb = winTieBreaker {
            return tb
        } else {
            return (winner, [card1, card2])
        }
    }
    
    func playTieBreaker(cards: [Card?]) -> (Player?, [Card?]) {
        var cardUp1 = player1.flip()
        var cardUp2 = player2.flip()
        var cardDown1 = player1.flip()
        var cardDown2 = player2.flip()
        var winner: Player?
        let newCards = cards + [cardDown1, cardDown2, cardUp1, cardUp2]
        
        if let c1 = cardUp1, let c2 = cardUp2 {
            if c1.rank.rawValue == c2.rank.rawValue {
                return playTieBreaker(cards: newCards)
            } else {
                if c1.rank.rawValue > c2.rank.rawValue {
                    winner = player1
                    award(cards: newCards, to: player1)
                } else {
                    winner = player2
                    award(cards: newCards, to: player2)
                }
            }
        } else if cardUp1 != nil {
                winner = player1
                cardUp2 = nil
        } else if cardUp2 != nil {
                winner = player2
                cardUp1 = nil
        } else {
                winner = nil
        }
        return (winner, newCards)
        
    }
    
    func award(cards: [Card?], to player: Player) {
        for card in cards {
            player.give(card: card!)
        }
    }
    
    func gameOver() -> Bool {
        return !player1.hasCards() || !player2.hasCards()
    }
    
    
}


