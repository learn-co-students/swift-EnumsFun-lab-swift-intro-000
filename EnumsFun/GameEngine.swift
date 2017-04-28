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
    init(player1name: String, player2name: String) {
        self.deck = Deck()
        let decks = self.deck.split()
        self.player1 = Player(name: player1name, hand: Hand(cards: decks.0))
        self.player2 = Player(name: player2name, hand: Hand(cards: decks.1))
    }
    func playOneTurn() -> (Player, Card?, Card?) {
        let player1card = player1.flip()
        let player2card = player2.flip()
        var winner: Player
        if (player1card?.rank.rawValue)! > (player2card?.rank.rawValue)! {
            winner = player1
        } else {
            winner = player2
        }
        return (winner, player1card, player2card)
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


