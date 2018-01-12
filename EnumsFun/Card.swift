//
//  Card.swift
//  EnumsFun
//
//  Created by Michael Dippery on 8/2/16.
//  Copyright © 2016 Gamesmith, LLC. All rights reserved.
//

import Foundation

enum Suit: String {
    

}

enum Rank: Int {
    case 2,3,4,5,6,7,8,9,10,"J","Q","K","A"
    var stringValue: String {
        switch self {
            case "2","3","4","5","6","7","8","9","10":
                return String(self)
            case "J":
                return 11
            case "Q":
                return 12
            case "K":
                return 13
            case "A":
                return 14
        }
    }
}

class Card {
    var suit: String
    var rank: Int
    var description: String {
        return "\(rank)\(suit)"
    }
    
    init(rank: Int, suit: String) {
        self.rank = rank
        self.suit = suit
    }
}
