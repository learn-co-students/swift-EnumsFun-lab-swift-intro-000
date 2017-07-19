//
//  Card.swift
//  EnumsFun
//
//  Created by Michael Dippery on 8/2/16.
//  Copyright © 2016 Gamesmith, LLC. All rights reserved.
//

import Foundation

enum Suit: String {
    
    case heart = "♥️"
    case diamond = "♦️"
    case spade = "♠️"
    case club = "♣️"

}

enum Rank: Int {
    
    case two = 2, three, four, five, six, seven, eight, nine, ten, jack, queen, king, ace
 
}

class Card {
    
    var suit: Suit
    var rank: Rank
    
    var description: String {
        return "\(rank)\(suit)"
    }
    
    init(rank: Rank, suit: Suit) {
        self.suit = suit
        self.rank = rank
    }

    
}
