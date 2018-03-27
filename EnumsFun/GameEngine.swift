//
//  GameEngine.swift
//  EnumsFun
//
//  Created by Michael Dippery on 8/2/16.
//  Copyright © 2016 Gamesmith, LLC. All rights reserved.
//

import Foundation

class GameEngine {
    
    var player1:Player = Player()
    var player2:Player = Player()
    var deck:Deck
    var tempCardArray:[Card] = []
    //var deckOfCards:[Card] = []
    
    init (player1:String, player2:String) {
        
        self.player1.name = player1
        self.player2.name = player2
        deck = Deck()
        //let deckOfCards = deck.cards
        let splitDeckTuple = deck.split2()
        //print("DeckTuple = \(splitDeckTuple)")
        self.player1.hand.cards = splitDeckTuple.0
        //print("playe1 cards = \(self.player1.hand.cards)")
        self.player2.hand.cards = splitDeckTuple.1
        //print("playe2 cards = \(self.player2.hand.cards)")
    }
    
    func playOneTurn() -> (Player, Card?, Card?) {
        
        let card1 = player1.flip()
        let card2 = player2.flip()
        
        while card1?.rank.rawValue == nil && ((card2?.rank.rawValue) == nil) {
            
            tempCardArray.append(card1!)
            tempCardArray.append(card2!)
            let card1 = player1.flip()
            let card2 = player2.flip()
            if ((card1!.rank.rawValue)) > ((card2!.rank.rawValue)) {
                award(cards: tempCardArray, to: player1)
                tempCardArray = []
                return (player1,card1,card2)
            } else if ((card1!.rank.rawValue)) < ((card2!.rank.rawValue)) {
                award(cards: tempCardArray, to: player2)
                tempCardArray = []
                return (player2,card1,card2)
            }
        }
        
        if  ((card1?.rank.rawValue) != nil) && ((card2?.rank.rawValue) != nil) {
            if ((card1!.rank.rawValue)) > ((card2!.rank.rawValue)) {
                
                return (player1,card1,card2)
                
            }
            return (player2,card1,card2)
            
        } else if card1?.rank.rawValue == nil && ((card2?.rank.rawValue) != nil) {
            return (player2,card1,card2)
        }
            return (player1,card1,card2)
        
    }
    
    
    func award(cards:[Card],to player:Player) {
        
        for card in cards {
            player.hand.give(card: card)
        }
    }
    
    func gameOver() -> Bool {
        if player1.hasCards() && player2.hasCards() {
            return false
        }
        return true
    }
 
}






















