//
//  Deck.swift
//  EnumsFun
//
//  Created by Michael Dippery on 8/2/16.
//  Copyright © 2016 Gamesmith, LLC. All rights reserved.
//

import Foundation

class Deck {
    var cards:[Card]
    
    init(){
        self.cards = []
        let rankList = [2,3,4,5,6,7,8,9,10,11,12,13,14]
        let suitList = [ "♠️", "♦️", "♥️", "♣️"]
        
        for rankVal in rankList{
            
            for suitVal in suitList{
                let card = Card(rank:Rank(rawValue:rankVal)!,suit:Suit(rawValue:suitVal)!)
                
                self.cards.append(card)
            }
        }
        self.cards.shuffle()
    }
    
    
    func split()->([Card],[Card]){
        return self.cards.split()
    }
    
}

