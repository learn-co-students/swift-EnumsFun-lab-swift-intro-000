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
    var cards: [Card] = []
    
    init() {
        var cards: [Card] = []
        var rank1 : Rank
        var suit1 : Suit
        var card : Card
        
        for suit_loop in ["♠️", "♣️", "♥️", "♦️"] {
            for rank_loop in [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13] {
                
                //let rank1: Rank? = Rank(rawValue : 5)!
                //rank1 = Rank(rawValue : rank_loop)!
                //let suit1: Suit? = Suit(rawValue : "♠️")!
                //suit1 = Suit(rawValue : suit_loop)!
                
                //card = Card(suit: suit1, rank: rank1)
                //cards.append(card)
            }
        }
        //shuffle()
    }
    
    func split() -> ([Card], [Card]) {
        let middle = 52 / 2
        let left = cards[0..<middle]
        let right = cards[middle..<52]
        return (Array(left), Array(right))
    }
    
    func shuffle() {
        cards.shuffle()
    }
}


/*
describe("Deck") {
    let deck = Deck()
    describe("initializer") {
        it("creates an array of 52 cards") {
            expect(deck.cards.count).to(equal(52))
        }
}
 */
