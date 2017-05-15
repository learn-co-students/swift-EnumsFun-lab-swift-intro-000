//
//  GameEngine.swift
//  EnumsFun
//
//  Created by Michael Dippery on 8/2/16.
//  Copyright © 2016 Gamesmith, LLC. All rights reserved.
//

import Foundation

class GameEngine {
    
    let player1: Player;
    let player2: Player;
    let deck: Deck;
    
    init(player1: String, player2: String) {
        deck = Deck.init()
        
        let (firstHalf, secondHalf) = deck.split();
        
        self.player1 = Player.init(name: player1, hand: Hand.init(cards: firstHalf));
        self.player2 = Player.init(name: player2, hand: Hand.init(cards: secondHalf));
    }
    
    func playOneTurn() -> (Player, Card?, Card?){
        
        let player1Flip = player1.flip();
        let player2Flip = player2.flip();
        
        if (player1Flip != nil && player2Flip != nil) {
            if player1Flip!.rank.rawValue > player2Flip!.rank.rawValue || player1Flip!.rank.rawValue == player2Flip!.rank.rawValue {
                return (player1, player1Flip, player2Flip);
            } else {
                return (player2, player1Flip, player2Flip);
            }
        }
        
        if (player1Flip != nil) {
            return (player1, player1Flip, nil);
        }
        
        return (player2, nil, player2Flip);
        
    }
    
    func award(cards: [Card], to player: Player) {
        for card in cards {
            player.give(card: card);
        }
    }
    
    func gameOver() -> Bool {
        
        if player1.hasCards() && player2.hasCards() {
            return false;
        }
        
        return true;
    }
    
}


