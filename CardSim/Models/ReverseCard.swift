//
//  ReverseCard.swift
//  CardSim
//
//  Created by Andre Gustavo on 11/06/2019.
//  Copyright © 2019 Andre Gustavo. All rights reserved.
//

import Foundation

struct ReverseCard: Card {
    var name: String { return "reverse" }
    let direction: GameDirection = .reverse
    
    func discardPriority(pileCard: Card) -> DiscardPriority {
        return .medium
    }
}
