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
    
    var deck:Deck = Deck()
    
    init(player1:String, player2:String){

        self.player1 = Player.init(name: player1, hand: Hand(cards: deck.cards.split().0))
        self.player2 = Player.init(name: player2, hand: Hand(cards: deck.cards.split().1))
    }
    
    
    
    func playOneTurn()->(Player, Card?, Card?){
        
       
        if let card1 = player1.flip(){
            if let card2 = player2.flip(){
                if (card1.rank.rawValue) > (card2.rank.rawValue){
                    return (player1,card1,card2)
                }
                else {
                    return (player2,card2,card1)
                }
              }
        }
        return (player2,nil,nil)
        
    }
    
        func award(cards:[Card],to:Player){
        for card in cards{
            to.give(card: card)
        }
        
    }
    func gameOver()->Bool{
        return ((player1.hand.cards.isEmpty) || (player2.hand.cards.isEmpty))
    }
}
