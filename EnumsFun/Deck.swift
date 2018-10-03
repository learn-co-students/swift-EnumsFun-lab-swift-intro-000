//
//  Deck.swift
//  EnumsFun
//
//  Created by Michael Dippery on 8/2/16.
//  Copyright © 2016 Gamesmith, LLC. All rights reserved.
//

import Foundation

class Deck {
    let fourSuits = ["♠️", "♦️", "❤️", "♣️"]
    var cards: [Card] = []
    var newCard: Card = Card(rank: Rank.two, suit: Suit.spades)
    
    init () {
        for suit in fourSuits {
            for i in 1...14 {
                if var rankUnwrapped = Rank(rawValue: i) {
                newCard = Card(rank: rankUnwrapped, suit: Suit(rawValue: suit)!)
                cards.append(newCard)
                }
            }
        }
        let shuffledCards = cards.shuffled()
        cards = shuffledCards
    }
    
    func split (cards: [Card])-> ([Card],[Card]) {
        return cards.split()
    }
}


