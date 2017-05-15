//
//  Player.swift
//  EnumsFun
//
//  Created by Michael Dippery on 8/2/16.
//  Copyright © 2016 Gamesmith, LLC. All rights reserved.
//

import Foundation

class Player {
    let name: String;
    var hand: Hand;
    
    init(name: String, hand: Hand) {
        self.name = name;
        self.hand = hand;
    }
    
    func hasCards() -> Bool {
        if hand.cards.count > 0 {
            return true;
        }
        
        return false;
    }
    
    func flip() -> Card? {
        return hand.cards.popLast();
    }
    
    func give(card: Card) {
        hand.cards.append(card);
    }
    
    func lose(card: Card) {
        
        for (index, loopedCard) in hand.cards.enumerated() {
            if loopedCard == card {
                hand.cards.remove(at: index);
            }
        }
    }
 
}

