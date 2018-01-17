//
//  GameEngine.swift
//  EnumsFun
//
//  Created by Michael Dippery on 8/2/16.
//  Copyright © 2016 Gamesmith, LLC. All rights reserved.
//

import Foundation

class GameEngine {
    var player1:Player
    var player2: Player
    var deck:Deck

    init(playerName1:String, playerName2:String) {
        self.deck = Deck()
        let (pile1,pile2) = deck.split()
        let hand1 = Hand(cards: pile1)
        let hand2 = Hand(cards: pile2)
        player1 = Player(name: playerName1, hand: hand1)
        player2 = Player(name: playerName2, hand: hand2)
    }
    func playOneTurn()->(Player,Card?,Card?){
        if !player1.hasCards(){
            return (player2,nil,nil)
        }
        if !player2.hasCards(){
            return(player1,nil,nil)
        }
        let player1Card = player1.flip()
        let player2Card = player2.flip()

        if player1Card!.rank.rawValue > player2Card!.rank.rawValue{
            awardCards(cards: [player1Card!,player2Card!], toPlayer: player1)
            return (player1,player1Card,player2Card)
        }else{
            awardCards(cards: [player2Card!,player1Card!], toPlayer: player2)
            return (player2,player2Card,player1Card)
        }
    }
    func awardCards(cards:[Card],toPlayer:Player){
        for card in cards{
            toPlayer.give(card: card)
        }
    }
    func gameOver()->Bool{
        return player1.hasCards() && player2.hasCards()
    }
}


