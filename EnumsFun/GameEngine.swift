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
    var player2:Player
    var cardsInPlay:[Card] = []
    var deck:Deck = Deck()
    
    init(player1:String, player2:String){

        self.player1 = Player.init(name: player1, hand: Hand(cards: deck.cards.split().0))
        self.player2 = Player.init(name: player2, hand: Hand(cards: deck.cards.split().1))
        print(deck.cards.split().0.count)
        print(deck.cards.split().1.count)
    }
    
    var playCount = 0
    func playOneTurn()->(Player, Card?, Card?){

        if let card1 = player1.hand.flip(){
            if let card2 = player2.hand.flip(){
                //print(player2.hand.cards.count)
                getCardsInPlay(card1,card2)
                playCount += 1
                print("cardPlay count:\(playCount)")
                print("player 2 card count: \(player2.hand.cards.count)")
                print("player 1 card count: \(player1.hand.cards.count)")
                print("cards in play: \(cardsInPlay.count)")

                

                if (card1.rank.rawValue) > (card2.rank.rawValue){
                   award(cards: cardsInPlay, to: player1)
                    return (player1,card1,card2)
                }
            else {
                    award(cards:cardsInPlay, to: player2)
                    return (player2,card1,card2)
                }
            }
        }
        return (player2,nil,nil)
    }
    
    func getCardsInPlay(_ card1:Card,_ card2:Card) {
        cardsInPlay.append(card1)
        cardsInPlay.append(card2)
       
    }
    
        func award(cards:[Card],to:Player){
            for card in cards{
                to.give(card: card)
            }
            cardsInPlay.removeAll()
    }
    
    func gameOver()->Bool{
        return ((player1.hand.cards.isEmpty) || (player2.hand.cards.isEmpty))
    }
}
