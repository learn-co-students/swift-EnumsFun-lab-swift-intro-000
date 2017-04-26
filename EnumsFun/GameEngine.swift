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
    
    init(player1: String, player2: String){
        self.deck = Deck( )
        let split_deck = self.deck.split( )
        
        self.player1 = Player(name: player1, hand: Hand(cards: split_deck.0))
        self.player2 = Player(name: player2, hand: Hand(cards: split_deck.1))
    }
    
    func playOneTurn( ) -> (Player, Card?, Card?) {
        var winner_declared: Bool = false
        while !winner_declared {
            if !player1.hasCards( ) {
                winner_declared = true
                return (player2, nil, nil)
                
            }
            else if !player2.hasCards(){
                winner_declared = true
                return (player1, nil, nil)
            }
            
            let player1Card = player1.flip()!
            let player2Card = player2.flip()!
            
            if player1Card.rank.rawValue > player2Card.rank.rawValue {
                winner_declared = true
                return (player1, player1Card, player2Card)
            
            }
            else if player1Card.rank.rawValue < player2Card.rank.rawValue {
                winner_declared = true
                return (player2, player1Card, player2Card)
            }
        }
    }
    
    func award(cards: [Card], to player: Player){
        for card in cards{
            player.give(card: card)
        }
    }
    
    func gameOver( ) -> Bool {
        return !player1.hasCards() || !player2.hasCards()
    }
}


