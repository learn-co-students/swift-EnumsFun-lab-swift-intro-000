//
//  Deck.swift
//  EnumsFun
//
//  Created by Michael Dippery on 8/2/16.
//  Copyright © 2016 Gamesmith, LLC. All rights reserved.
//

import Foundation

class Deck {
    var cards: [Card]
    
    init() {
        cards = [Card]()
        
        for i in 2...14 {
            for j in 1...4 {
                var suit: String = ""

                switch j {
                case 1:
                    suit = "♠️"
                case 2:
                    suit = "♣️"
                case 3:
                    suit = "♥️"
                case 4:
                    suit = "♦️"
                default:
                    suit = "x"
                }
                cards.append(Card(rank: Rank(rawValue: i)!, suit: Suit(rawValue: suit)!))
            }
        }
        cards.shuffle()
    }//end of init
    
    func split() -> ([Card], [Card]) {
        return cards.split()
    }

}// end of class


