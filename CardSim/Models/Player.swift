//
//  Player.swift
//  CardSim
//
//  Created by Andre Gustavo on 11/06/2019.
//  Copyright © 2019 Andre Gustavo. All rights reserved.
//

import Foundation

class Player {
    private struct CardComparisonResult {
        let index: Int
        let card: Card
        let priority: DiscardPriority
    }
    
    private var cards: [Card]
    
    let name: String
    
    var cardCount: Int {
        return cards.count
    }
    
    required init(name: String, cardA: Card, cardB: Card, cardC: Card) {
        self.name = name
        self.cards = [cardA, cardB, cardC]
    }
    
    func play(pileCard: Card) -> Card? {
        let removableCards = cards.enumerated().reduce([CardComparisonResult]()) { (partial, item) -> [CardComparisonResult] in
            let priority = item.element.discardPriority(pileCard: pileCard)
            guard priority != .none else { return partial }
            return partial + [CardComparisonResult(index: item.offset, card: item.element, priority: priority)]
        }.sorted(by: {$0.priority > $1.priority})
        
        guard let toRemove = removableCards.first else {
            return nil
        }
        
        cards.remove(at: toRemove.index)
        
        return toRemove.card
    }
}
