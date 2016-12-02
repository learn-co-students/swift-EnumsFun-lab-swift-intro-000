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
    let deck : Deck
    
    
    init(player1 : String, player2 : String) {
        self.deck = Deck()
        
        let (cards1, cards2) = self.deck.split()
        
        let hand1 = Hand(cards : cards1)
        let hand2 = Hand(cards : cards2)
        
        self.player1 = Player(name: player1, hand: hand1)
        self.player2 = Player(name: player2, hand: hand2)
        
    }
    
    
    
    func playOneTurn() -> (Player, Card?, Card?) {
        
        if !player1.hasCards(){
            return (player2, nil, nil)
        } else if !player2.hasCards(){
            return (player1, nil, nil)
        }
        
        let turnCard1 = player1.flip()!
        let turnCard2 = player2.flip()!
        
        if turnCard1.rank.rawValue > turnCard2.rank.rawValue{
            awardCards(player: player1, cards: [turnCard1, turnCard2])
            return (player1, turnCard1, turnCard2)
        } else {
            awardCards(player: player2, cards: [turnCard1, turnCard2])
            return (player2, turnCard1, turnCard2)
        }
    }
    
    func awardCards(player: Player, cards: [Card]){
        for card in cards {
            player.give(card: card)
        }
    }
    
    func gameOver() -> Bool {
        return !player1.hasCards() || !player2.hasCards()
    }
    
}

