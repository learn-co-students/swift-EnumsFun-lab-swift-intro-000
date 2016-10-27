//
//  GameEngine.swift
//  EnumsFun
//
//  Created by Michael Dippery on 8/2/16.
//  Copyright © 2016 Gamesmith, LLC. All rights reserved.
//

import Foundation

class GameEngine {
    
    
    var player1:Player
    var player2:Player
    var deck:Deck
    
    init(player1:String,player2:String) {
        
        self.deck = Deck()
        
        let myCards = self.deck.split()
        
        let hand1 = Hand(cards: myCards.0)
        let hand2 = Hand(cards: myCards.1)
        
        self.player1 = Player(name:player1,hand:hand1)
        self.player2 = Player(name: player2, hand: hand2)
        
        
        
    }
    
    
    func playOneTurn()->(Player,Card?,Card?){
        
        var ply1Card:Card
        var ply2Card:Card
        
        // print("\(ply1Card?.rank.rawValue) - \(ply2Card?.rank.rawValue)")
        
        if !self.player1.hasCards(){
            print("ply1 not found")
            ply2Card =  self.player2.flip()!
             return (self.player2,nil,nil)
        }else if !self.player2.hasCards() {
             print("ply2 not found")
            ply1Card =  self.player1.flip()!
            return (self.player1,nil,nil)

        }else {
         ply1Card =  self.player1.flip()!
         ply2Card =  self.player2.flip()!
        }
        
        
        
           if ply1Card.rank.rawValue > ply2Card.rank.rawValue {
                 return (self.player1,ply1Card,ply2Card)
            }else {
             return (self.player2,ply1Card,ply2Card)
            }
        
            
        
    }
    
    
    func award(cards:[Card],to:Player){
        
        for card in cards {
            
            to.hand.give(card: card)
            
        }
        
        
        
    }
    
    
    func gameOver()->Bool{
        
        return !self.player1.hasCards() || !self.player2.hasCards()
        
    }
    
    
}
