//
//  Card.swift
//  EnumsFun
//
//  Created by Michael Dippery on 8/2/16.
//  Copyright © 2016 Gamesmith, LLC. All rights reserved.
//

import Foundation

enum Suit: String {
    case Spades = "♠️", Diamonds = "♦️", Hearts = "♥️", Clubs = "♣️"
}

enum Rank: Int {
    case two = 2, three, four, five, six, seven, eight, nine, ten, jack, queen, king, ace
    
    var stringValue: String {
        
        switch self.rawValue{
        case 0..<11:
            return "\(self.rawValue)"
            case 11:
                print("j")
                return "J"
            case 12:
                print("q")
                return "Q"
            case 13:
                print("k")
                return "K"
            case 14:
                print("a")
                return "A"
            default:
                return "unknown"
            }
        }
    }



class Card {

    var suit: Suit
    var rank: Rank
    var description:String{
        return "\(rank.stringValue)\(suit.rawValue)"
    }
    
    
    init(rank:Rank, suit:Suit){
        self.rank = rank
        self.suit = suit
    }
}



