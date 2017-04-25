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
    
    let deck: Deck
    
    init(player1: String, player2: String) {
        deck = Deck()
        
        let splitDeck = deck.split()
        
        self.player1 = Player(name: player1, hand: Hand(cards: splitDeck.0))
        self.player2 = Player(name: player2, hand: Hand(cards: splitDeck.1))
    }

    func playOneTurn() -> (Player, Card?, Card?) {
        let playerOneCard = player1.flip()
        let playerTwoCard = player2.flip()
        let winner: Player
        
        if playerOneCard == nil  {
            winner = player2
        } else if playerTwoCard == nil {
            winner = player1
        } else {
            if (playerOneCard)!.rank.rawValue > (playerTwoCard)!.rank.rawValue {
                winner = player1
            } else {
                winner = player2
            }
        }
        
        if playerOneCard == nil || playerTwoCard == nil {
            return (winner, nil, nil)
        } else {
            return (winner, playerOneCard, playerTwoCard)
        }
    }
    
    func award(cards: [Card], to player: Player) {
        for card in cards {
            player.give(card: card)
        }
    }
    
    func gameOver() -> Bool {
        return player1.hand.cards.isEmpty || player2.hand.cards.isEmpty
    }
    
    
}


