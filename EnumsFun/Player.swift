//
//  Player.swift
//  EnumsFun
//
//  Created by Michael Dippery on 8/2/16.
//  Copyright © 2016 Gamesmith, LLC. All rights reserved.
//

import Foundation

class Player {
    
    var name : String
    var hand : Hand
    
    init(name : String, hand : Hand) {
        
        self.name = name
        self.hand = hand
    }
    
    func hasCards() -> Bool{
        return true
    }
    
    /*
    func flip() -> Card? {
        if self.hand.hasCards(){
            return self.hand.cards[0]
        } else {
            return nil
        }
    } */
    
}

/*
let rank1 = Rank(rawValue: 10)!
let rank2 = Rank(rawValue: 11)!
let suit1 = Suit(rawValue: "♥️")!
let suit2 = Suit(rawValue: "♠️")!

let card1 = Card(suit: suit1, rank: rank1)
let card2 = Card(suit: suit2, rank: rank2)

var hand = Hand(cards: [card1, card2])
var player = Player(name: "Player", hand: hand)
*/
