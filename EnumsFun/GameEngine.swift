//
//  GameEngine.swift
//  EnumsFun
//
//  Created by Michael Dippery on 8/2/16.
//  Copyright © 2016 Gamesmith, LLC. All rights reserved.
//

import Foundation

class GameEngine {
    var player1 : Player
    var player2 : Player
    
    var deck : Deck
    
    init(player1 : String, player2 : String) {
        deck = Deck();
        
        let cards = deck.split()
        let hand1 = Hand(cards: cards.0);
        let hand2 = Hand(cards: cards.1);
        
        self.player1 = Player(name : player1, hand : hand1);
        self.player2 = Player(name : player2, hand : hand2);
        
    }
    
    func playOneTurn() -> (Player, Card?, Card?) {
        let card1 = self.player1.flip()
        let card2 = self.player2.flip()
        
        if (card1 == nil) {
            return (player2, card1, card2)
        }
        
        if (card2 == nil) {
            return (player1, card1, card2)
        }
        
        let rank1 = card1!.rank
        let rank2 = card2!.rank
        if (rank1.rawValue > rank2.rawValue) {
            return (player1, card1, card2)
        }
        else {
            return (player2, card1, card2)
        }
        
    }
    
    func award(cards : [Card], to : Player) {
        for card in cards {
            to.give(card : card)
        }
    }
    
    func gameOver() -> Bool{
        if (player1.hasCards() == false || player2.hasCards() == false) {
            return true;
        }
        
        return false;
    }
}
