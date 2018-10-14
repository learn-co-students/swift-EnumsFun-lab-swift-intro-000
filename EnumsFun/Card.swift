//
//  Card.swift
//  EnumsFun
//
//  Created by Michael Dippery on 8/2/16.
//  Copyright © 2016 Gamesmith, LLC. All rights reserved.
//

import Foundation

enum Suit: String {
    
    case diamonds = "♦️"
    case clubs = "♣️"
    case hearts = "♥️"
    case spades = "♠️"
    
    var stringSuit: String {
        
        switch self{
        case .clubs:
            return "♣️"
        case .diamonds:
            return "♦️"
        case .hearts:
            return "♥️"
        case .spades:
            return "♠️"
        }
        
    }
    
    
    

}

enum Rank: Int {
    
     case two = 2, three, four, five, six, seven, eight, nine, ten, jack, queen, king, ace
    
    var stringValue: String {
        switch self {
        case .two:
            return "2"
        case .three:
            return "3"
        case .four:
            return "4"
        case .five:
            return "5"
        case .six:
            return "6"
        case . seven:
            return "7"
        case .eight:
            return "8"
        case .nine:
            return "9"
        case .ten:
            return "10"
        case .jack:
            return "J"
        case .queen:
            return "Q"
        case .king:
            return "K"
        case .ace:
            return "A"
        }
    }
 
}

class Card {
    
    var suit: Suit
    var rank: Rank
    
    var description: String{
        return "\(self.rank.stringValue)\(self.suit.stringSuit)"
    }
    
    init (rank: Rank, suit: Suit){
        self.rank = rank
        self.suit = suit
    }

    
}

