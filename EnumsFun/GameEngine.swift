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
    var pile: [Card] = []
    var Tie : Player
    
    init (player1: String, player2: String) {
        
        self.deck = Deck()
        
        let deck1 = Hand(cards: deck.split().0)
        let deck2 = Hand(cards: deck.split().1)

        self.player1 = Player(name: player1, hand: deck1)
        self.player2 = Player(name: player2, hand: deck2)
        Tie = Player(name: "Tie, Play again!!", hand: deck1 )
        
    }
    
    func playOneTurn() -> (Player, Card?, Card?) {
        
        guard player1.hasCards() else { return (player2, nil, nil) }
        guard player2.hasCards() else { return (player1, nil, nil) }
        
        let card1 = player1.flip()!
        let card2 = player2.flip()!
        
        let card1Value = card1.rank.rawValue
        let card2Value = card2.rank.rawValue
        
        
        pile.append(card1)
        pile.append(card2)
        
        
        if card1Value == card2Value {
          return (Tie, card1, card2)
            
        } else if card1Value > card2Value {
            award(cards: pile, to: player1)
            pile.removeAll()
            return (player1, card1, card2)
        } else {
            award(cards: pile, to: player2)
            pile.removeAll()
            return (player2, card1, card2)
        }
    
    }

    func award(cards: [Card], to: Player) {
    
        for i in cards {
            to.give(card: i)
        }
}
    
    func gameOver() -> Bool {
        return !player1.hasCards() || !player2.hasCards()
        
    }
}
