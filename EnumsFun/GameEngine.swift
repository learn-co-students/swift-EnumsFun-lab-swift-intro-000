//
//  GameEngine.swift
//  EnumsFun
//
//  Created by Michael Dippery on 8/2/16.
//  Copyright © 2016 Gamesmith, LLC. All rights reserved.
//

import Foundation

class GameEngine {
  
  let player1: Player
  let player2: Player
  let deck = Deck()
  
  init(player1: String, player2: String) {
    deck.cards.shuffle()
    let splitDeck = deck.split()
    let player1Hand = splitDeck.0
    let player2Hand = splitDeck.1
    self.player1 = Player(name: player1, hand: Hand(cards: player1Hand))
    self.player2 = Player(name: player2, hand: Hand(cards: player2Hand))
  }
  
  func playOneTurn() -> (Player, Card?, Card?) {
    if let player1Card = player1.flip() {
      if let player2Card = player2.flip() {
        if player1Card.rank.rawValue > player2Card.rank.rawValue || player1Card.rank.rawValue == player2Card.rank.rawValue {
          return (player1, player1Card, player2Card)
        } else {
          return(player2, player1Card, player2Card)
        }
      } else {
        return (player1, player1Card, nil)
      }
    } else {
      let player2Card = player2.flip()
      return (player2, nil, player2Card)
    }
  }
  
  func award(cards: [Card], player: Player) {
    for card in cards {
      player.give(card: card)
    }
  }
  
  func gameOver() -> Bool {
    return !player1.hasCards() || !player2.hasCards()
  }
}



