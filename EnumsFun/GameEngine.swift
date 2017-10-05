//
//  GameEngine.swift
//  EnumsFun
//
//  Created by Michael Dippery on 8/2/16.
//  Copyright © 2016 Gamesmith, LLC. All rights reserved.
//

import Foundation

class GameEngine {
    

    var player1 : Player;
    var player2 : Player;
    var deck : Deck;
    
    init(player1 : String, player2 : String) {
        self.deck = Deck();
        let splitDeck = deck.split();
        self.player1 = Player(name: player1, hand: Hand(cards: splitDeck.0));
        self.player2 = Player(name: player2, hand: Hand(cards: splitDeck.1));
    }
    
    func playOneTurn() -> (Player, Card?, Card?) {
        var p1Card = Card(Rank.ACE, Suit.SPADE);
        var p2Card = Card(Rank.ACE, Suit.SPADE);
        
        
        if let c = player1.flip() {
            p1Card = c;
        }
        if let c = player2.flip() {
            p2Card = c;
        }
        if(p1Card.rank.rawValue > p2Card.rank.rawValue) {
            return(player1, p1Card, p2Card);
        } else {
            return(player2, p1Card, p2Card);
        }
    }
    
    func award(cards : [Card], player : Player) {
        for card in cards {
            player.give(card: card);
        }
    }
    
    func gameOver() -> Bool {
        if(player1.hasCards() && player2.hasCards()) {
            return false;
        } else {
            return true;
        }
    }
    
}


