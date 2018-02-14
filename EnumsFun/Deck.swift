//
//  Deck.swift
//  EnumsFun
//
//  Created by Michael Dippery on 8/2/16.
//  Copyright © 2016 Gamesmith, LLC. All rights reserved.
//

import Foundation

class Deck {
    
    var cards: [Card] //property cards of type [Card]
    
    init() {
        cards = []
        for suit in ["♠️","♦️", "❤️", "♣️"] { //creating the suit variable here, instead of in card.swift
            for rank in 2...14 {
                //need to set suit and rank for every card, then call Card initializer from Card.swift
                let suit = Suit(rawValue: suit)!
                let rank = Rank(rawValue: rank)!
                let card = Card(suit: suit, rank: rank)
                cards.append(card)
            }
        }
        cards.shuffle()
    }
    func split()->([Card], [Card]) {
        return cards.split()
    }
}


