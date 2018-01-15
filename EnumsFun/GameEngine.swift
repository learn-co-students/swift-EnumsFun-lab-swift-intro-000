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
        deck = Deck()
        let (pile1, pile2) = deck.split()
        let hand1 = Hand(cards: pile1)
        let hand2 = Hand(cards: pile2)
        player1 = Player(name: player1name, hand: hand1)
        player2 = Player(name: player2name, hand: hand2)
    }
    
    func playOneTurn () -> (Player, Card?, Card?) {
        if !player1.hasCards() { return (player2, nil, nil) }
        if !player2.hasCards() { return (player1, nil, nil) }

        let player1card = player1.flip()
        let player2card = player2.flip()
        
        if player1card!.rank.rawValue > player2card!.rank.rawValue {
            awardCards(cards: [player1card!, player2card!], toPlayer: player1)
            return (player1, player1card, player2card)
        }
        else {
            awardCards(cards: [player1card!, player2card!], toPlayer: player2)
            return (player2, player1card, player2card)
        }
    }
    
    func awardCards(cards: [Card], toPlayer: Player) {
        for card in cards {
            toPlayer.give(card: card)
        }
    }
    
    func gameOver() -> Bool {
        return player1.hasCards() && player2.hasCards()
    }
}


