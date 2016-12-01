//
//  Hand.swift
//  EnumsFun
//
//  Created by Michael Dippery on 8/2/16.
//  Copyright © 2016 Gamesmith, LLC. All rights reserved.
//

import Foundation

class Hand{
    
    var cards : [Card] = []
    var size : Int {
        return cards.count
    }
    
    init(cards: [Card]) {
        self.cards = cards
    }
    
    func flip()-> Card? {
        if cards.count > 0{
            let card = cards[0]
            cards.remove(at:0) // should also remove card from hand
            return card
        } else {
            return nil
        }
    }
    
    func give(card: Card){
        cards.append(card)
    }
    
    func lose(card: Card){
        
        //if let result1 = cards.index(where: Card.rank.rawValue )
        //if let result1 = cards.indexOf(Card)
        let result1 = 0
        cards.remove(at: result1)
        
//        let result = find(cards, Card)

    }
    
    /*
    func drawCard() -> Card? {
        guard nextCard < cards.count else { return nil }
        let card = cards[nextCard]
        nextCard += 1
        return card
    }
    */
    
    
    
}
//var hand = Hand(cards: [card1, card2])
/*
let rank1 = Rank(rawValue: 10)!
let rank2 = Rank(rawValue: 11)!
let suit1 = Suit(rawValue: "♥️")!
let suit2 = Suit(rawValue: "♠️")!

let card1 = Card(suit: suit1, rank: rank1)
let card2 = Card(suit: suit2, rank: rank2)

var hand = Hand(cards: [card1, card2])
 
 */
