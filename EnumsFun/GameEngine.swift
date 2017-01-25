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
    var tieCase: Player
    var deck: Deck
    var cardPool: [Card] // All cards in pool go to winner of War (tie)
    
    init(player1: String, player2: String) {
        self.cardPool = []
        self.deck = Deck()
        let cards = deck.split()
        let hand1 = Hand(cards: cards.0)
        let hand2 = Hand(cards: cards.1)
        self.player1 = Player(name: player1, hand: hand1)
        self.player2 = Player(name: player2, hand: hand2)
        self.tieCase = Player(name: "TIE", hand: Hand(cards: cardPool))
    }
    
    // Should add more functions to clean this up
    func playOneTurn() -> (Player, Card?, Card?) {
        if player1.hasCards() && player2.hasCards() {
            let p1card = player1.flip()
            let p2card = player2.flip()
            if (p1card?.rank.rawValue)! > (p2card?.rank.rawValue)! {
                // Player 1 wins turn
                return (player1, p1card, p2card)
            } else if (p1card?.rank.rawValue)! < (p2card?.rank.rawValue)! {
                return (player2, p1card, p2card)
            } else {
                // Tie
                print("TIE! p1: \(p1card!.description) p2:\(p2card!.description)")
                
                // Could probably do this recusively?
                cardPool.append(p1card!)
                cardPool.append(p2card!)
                
                // Flip cards (face down irl)
                let card1 = player1.flip()
                let card2 = player2.flip()
                
                if card1 != nil && card2 != nil {
                    cardPool.append(card1!)
                    cardPool.append(card2!)
                } else {
                    print("ERROR: Player 1 or 2 has no cars")
                    print("END OF GAME?")
                    return (tieCase, nil, nil)
                }
                
                print("Cards in card pool:")
                for card in cardPool {
                    print(card.description, terminator: " ")
                }
                print("\n")
                return (tieCase, nil, nil)
            }
        } else if player1.hasCards() {
            // Player 2 has no cards
            print("ERROR: Player 2 has no cards")
            return (player1, nil, nil)
        } else {
            // Player 1 has no cards
            print("ERROR: Player 1 has no cards")
            return (player2, nil, nil)
        }
    }
    
    func award(card: [Card], player: Player) {
        for c in card {
            print("\(c.description) given to \(player.name)")
            player.give(card: c)
        }
    }
    
    func gameOver() -> Bool {
        if !player1.hasCards() || !player2.hasCards() {
            print("GAME OVER")
            return true
        } else {
            return false
        }
    }
}
