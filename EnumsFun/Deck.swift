//
//  Deck.swift
//  EnumsFun
//
//  Created by Michael Dippery on 8/2/16.
//  Copyright © 2016 Gamesmith, LLC. All rights reserved.
//

import Foundation

class Deck {
    
    var cards:[Card]
    
    init() {
        cards = []
        cards = createDeck()
        cards.shuffle()
        
    }
    
    func createDeck() -> [Card] {
        
        for i in ["♦︎","♥︎","♠︎","♣︎"] {
            for j in [2,3,4,5,6,7,8,9,10,11,12,13,14] {
                let card = Card(rank: Rank(rawValue: j)! , suit: Suit(rawValue: i)!)
                cards.append(card)
            }
        }
        //print("count = \(cards.count)")
        return cards
    }
    
    
    
    func split2() -> ([Card], [Card]) {
        let count = cards.count
        //print("count = \(count)")
        let middle = count / 2
        var deckHalf1:[Card] = []
        var deckHalf2:[Card] = []
        for i in 0..<middle {
            deckHalf1.append(cards[i])
        }
        for j in middle..<(count) {
            deckHalf2.append(cards[j])
        }
        //print("deckHalf1 = \(deckHalf1)")
        //print("deckHalf1 = \(deckHalf1)")
        return (deckHalf1, deckHalf2)
    }
  
}


