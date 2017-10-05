//
//  Card.swift
//  EnumsFun
//
//  Created by Michael Dippery on 8/2/16.
//  Copyright © 2016 Gamesmith, LLC. All rights reserved.
//

import Foundation

enum Suit: String {
    case HEART = "❤️"
    case CLUB = "♣️"
    case DIAMOND = "♦️"
    case SPADE = "♠️"
}

enum Rank: Int {
    case ONE = 1
    case TWO = 2
    case THREE = 3
    case FOUR = 4
    case FIVE = 5
    case SIX = 6
    case SEVEN = 7
    case EIGHT = 8
    case NINE = 9
    case TEN = 10
    case JACK = 11
    case QUEEN = 12
    case KING = 13
    case ACE = 14
    
    var stringValue : String {
        switch(self) {
        case .ONE:
            return "1"
        case .TWO:
            return "2"
        case .THREE:
            return "3"
        case .FOUR:
            return "4"
        case .FIVE:
            return "5"
        case .SIX:
            return "6"
        case .SEVEN:
            return "7"
        case .EIGHT:
            return "8"
        case .NINE:
            return "9"
        case .TEN:
            return "10"
        case .JACK:
            return "J"
        case .QUEEN:
            return "Q"
        case .KING:
            return "K"
        case .ACE:
            return "A"
        }
    }
 
}

class Card {
    
    var suit : Suit;
    var rank : Rank;
    var description : String {
        return rank.stringValue + suit.rawValue;
    }
    
    init(_ rank : Rank, _ suit : Suit) {
        self.suit = suit;
        self.rank = rank;
    }
}
