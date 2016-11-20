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
    
    init(player1:String,player2:String){
        self.deck = Deck()
        var cards1:[Card] = []
        var cards2:[Card] = []
        (cards1,cards2) = self.deck.split()
        
        self.player1 = Player(name:player1,hand:Hand(cards:cards1))
        self.player2 = Player(name:player2,hand:Hand(cards:cards2))
        
    }
    
    func playOneTurn()->(Player, Card?, Card?){
        var card1:Card? = self.player1.flip()
        var card2:Card? = self.player2.flip()!
        var winner:Player? = nil         //??
        
        if card1 == nil && card2 != nil{
            winner = self.player2
            card2 = nil      //for result
        }else
        if card2 == nil && card1 != nil{
            winner = self.player1
            card1 = nil      //for result
            
        }else
        if (card1!.rank.rawValue > card2!.rank.rawValue){
               winner = self.player1
        }else
        if (card1!.rank.rawValue < card2!.rank.rawValue){
                winner = self.player2
        }
        
        return (winner!,card1,card2)
    }
    
    func award(cards:[Card],to:Player){
        for c in cards{
            to.give(card: c)
        }
    }
    
    func gameOver()->Bool{
        if self.player1.hand.size == 0 || self.player2.hand.size == 0{
            return true
        }
        return false
    }
    
}
