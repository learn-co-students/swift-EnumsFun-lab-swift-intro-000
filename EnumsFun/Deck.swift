//
//  Deck.swift
//  EnumsFun
//
//  Created by Michael Dippery on 8/2/16.
//  Copyright © 2016 Gamesmith, LLC. All rights reserved.
//

import Foundation

class Deck {
    
    var cards : [Card];
    
    init() {
        var tempSuit : Suit
        var tempRank : Rank
        var tempCard : Card
        cards = [];
        for i in 1...4 {
            switch(i) {
            case 1:
                tempSuit = .HEART
            case 2:
                tempSuit = .CLUB
            case 3:
                tempSuit = .DIAMOND
            default:
                tempSuit = .SPADE
            }
            for j in 1...12 {
                tempRank = Rank(rawValue: j)!;
                tempCard = Card(tempRank, tempSuit);
                cards.append(tempCard)
            }
        }
        cards.shuffle();
    }
    
    func split() -> ([Card], [Card]) {
        return cards.split();
    }
}


