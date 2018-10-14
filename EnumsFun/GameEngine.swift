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
        
        self.deck = Deck()
        
        var deckO = deck.split()
        
        self.player1 = Player(name: player1, hand: Hand(cards: deckO.0) )
        self.player2 = Player(name: player2, hand: Hand(cards: deckO.1))
        
    }
    
    func playOneTurn() -> (Player, Card?, Card?) {
        
        var winner: Player = player1
        
        var x: Card?
        var y: Card?
        
       if player1.hasCards() == false && player2.hasCards() == false{
            
            y = nil
            x = nil
            winner = player2
            
        } else if player1.hasCards() == false && !player2.hasCards() == false {
            x = nil
            y = player2.flip()
        if player2.hasCards() == false {
            y = nil
        }
            winner = player2
        } else if player2.hasCards() == false  && !player1.hasCards() == false {
            y = nil
            x = player1.flip()
        if player1.hasCards() == false {
            x = nil
        }
            winner = player1
        } else  {
            x = player1.flip()
            y = player2.flip()
            
            if let x = x?.rank.rawValue {
                if let y = y?.rank.rawValue {
                    
                    if x>y {
                        winner = player1
                    } else {
                        winner = player2
                    }
            }
        }
        
        }
         return (winner, x, y)
    }
        
        func award(cards: [Card], to: Player) {
            
            for value in cards{
                to.give(card: value)
                
            }
            
        }
        
        func gameOver() -> Bool {
            
            if player1.hasCards() == false || player2.hasCards() == false {
                
                return true
            } else {
                return false
            }
            
        }
    }





