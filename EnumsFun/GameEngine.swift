//
//  GameEngine.swift
//  EnumsFun
//
//  Created by Michael Dippery on 8/2/16.
//  Copyright © 2016 Gamesmith, LLC. All rights reserved.
//

import Foundation

class GameEngine {
    var player1 : Player
    var player2 : Player
    var deck : Deck
    
    init(player1: String, player2 : String) {
        
        self.deck = Deck()
        let(cards1, cards2) = self.deck.split()
        let hand1 = Hand(cards: cards1)
        let hand2 = Hand(cards: cards2)
        
        self.player1 = Player(name: player1, hand: hand1)
        self.player2 = Player(name: player2, hand: hand2)

    }
    
    func playOneTurn() -> (Player, Card?, Card?){
        
        guard player1.hasCards() else { return (player2, nil, nil) }
        guard player2.hasCards() else { return (player1, nil, nil) }
        
       let card1 = player1.flip()
        let card2 = player2.flip()
        if (card1?.rank.rawValue)! > (card2?.rank.rawValue)! {
            return (player1, card1, card2)
        } else {
             return (player2, card1, card2)
        }
        
    }
    
    func award(player: Player, cards : [Card]) {
        for card in cards {
            player.give(card: card)
        }
        
    }
    
    func gameOver() -> Bool {
        return !player1.hasCards() || !player2.hasCards()
        
    }
    
}

