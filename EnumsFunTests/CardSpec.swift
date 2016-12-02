//
//  CardSpec.swift
//  EnumsFun
//
//  Created by Michael Dippery on 8/2/16.
//  Copyright © 2016 Gamesmith, LLC. All rights reserved.
//

import Foundation

import Foundation
import XCTest
import Quick
import Nimble
@testable import EnumsFun

class CardSpec: QuickSpec {
    override func spec() {
        
        describe("Card") {
            let rank = Rank(rawValue: 10)!
            let suit = Suit(rawValue: "♣️")!
            let card = Card(suit: suit, rank: rank)
            
            
            
            describe("initializer") {
                it("sets properties") {
                    expect(card.suit.rawValue).to(equal("♣️"))
                    expect(card.rank.rawValue).to(equal(10))
                }
            }
            
            
            describe("description") {
                it("returns a description of the card") {
                    expect(card.description).to(equal("10♣️"))
                }
                
                it("returns an appropriate description for face cards") {
                    
                    let suit = Suit(rawValue: "♣️")!
                    var rank = Rank(rawValue: 11)!
                    //var card = Card(rank: rank, suit: suit) NORI
                    var card = Card(suit: suit, rank:rank)
                    expect(card.description).to(equal("J♣️"))
                    
                    rank = Rank(rawValue: 12)!
                    //card = Card(rank: rank, suit: suit)
                    card = Card(suit:suit, rank:rank)
                    expect(card.description).to(equal("Q♣️"))
                    
                    rank = Rank(rawValue: 13)!
                    //card = Card(rank: rank, suit: suit)
                    card = Card(suit:suit, rank:rank)
                    expect(card.description).to(equal("K♣️"))
                    
                    rank = Rank(rawValue: 14)!
                    //card = Card(rank: rank, suit: suit)
                    card = Card(suit:suit, rank:rank)
                    expect(card.description).to(equal("A♣️"))
                    
                } 
            }
        }
    }
}
