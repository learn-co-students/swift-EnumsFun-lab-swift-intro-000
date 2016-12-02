//
//  Deck.swift
//  EnumsFun
//
//  Created by Michael Dippery on 8/2/16.
//  Copyright © 2016 Gamesmith, LLC. All rights reserved.
//

import Foundation

/*
 class Deck {
 
 var cards : [Card]
 
 init (){
 
 }
 } */


class Deck {
    var cards: [Card]
    
    init() {
        cards = []
        
        for suit_loop in ["♠️", "♣️", "♥️", "♦️"] {
            for rank_loop in 2...14 {
                
                let rank1: Rank = Rank(rawValue : rank_loop)!
                let suit1: Suit = Suit(rawValue : suit_loop)!
                
                let card = Card(suit: suit1, rank: rank1)
                cards.append(card)
            }
        }
        cards.shuffle()
    }
    
    /*
     func split() -> ([Card], [Card]) {
     let middle = 52 / 2
     let left = cards[0..<middle]
     let right = cards[middle..<52]
     return (Array(left), Array(right))
     } */
    
    func split() -> ([Card], [Card]){
        return cards.split()
    }
    
}

