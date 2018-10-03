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
    var deck: Deck
    
    init() {
        deck = Deck()
        let bothHalves = deck.cards.split()
        let player1Hand = bothHalves.0
        let player2Hand = bothHalves.1
        player1 = Player(name: "Mawia", hand: Hand(cards: player1Hand))
        player2 = Player(name: "CPU", hand: Hand(cards: player2Hand))
    }
    
    func playOneTurn() -> (Player, Card?, Card?) {
        
        var winningPlayer: Player
        var player1Card = player1.hand.flip()
        var player2Card = player2.hand.flip()
        var player1Num = player1Card!.rank.rawValue
        var player2Num = player2Card!.rank.rawValue
        var player1TieBreakCard = player1.hand.cards[1]
        var player2TieBreakCard = player2.hand.cards[1]
            if player1Num > player2Num {
                winningPlayer = player1
            } else if player1Num == player2Num {
                var player1TieBreakNum = player1TieBreakCard.rank.rawValue
                var player2TiebreakNum = player2TieBreakCard.rank.rawValue
                if player1TieBreakNum > player2TiebreakNum {
                    winningPlayer = player1
                } else {
                    winningPlayer = player2
                }
            } else {
                winningPlayer = player2
            }
            return (winningPlayer, player1Card, player2Card)
    }

    func award(cards: [Card], winningPlayer: Player) {
        winningPlayer.give(card: cards[0])
        winningPlayer.give(card: cards[1])
    }
    
    func gameOver() -> Bool {
        return !self.player1.hasCards() || !self.player2.hasCards()
    }
    
}


