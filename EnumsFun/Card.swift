//
//  Card.swift
//  EnumsFun
//
//  Created by Michael Dippery on 8/2/16.
//  Copyright © 2016 Gamesmith, LLC. All rights reserved.
//

import Foundation

enum Suit: String {
    case spades = "♠️", diamonds = "♦️", hearts = "♥️", clubs = "♣️"

}

enum Rank: Int {
   
    case two = 2, three, four, five, six, seven, eight, nine, ten, jack, queen, king, ace
    
    var stringValue: String {
        switch self {
        case .jack:
            return "J"
        case .queen:
            return "Q"
        case .king:
            return "K"
        case .ace:
            return "A"
        default:
            return "\(rawValue)"
        }
        
        
    }
 
}

class Card {
    
    let suit: Suit
    let rank: Rank
    
    var description: String {
        return rank.stringValue + suit.rawValue
    }
    
    init(rank: Rank, suit: Suit) {
        self.suit = suit
        self.rank = rank
    }

    
}
