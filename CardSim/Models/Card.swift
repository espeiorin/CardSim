//
//  Card.swift
//  CardSim
//
//  Created by Andre Gustavo on 11/06/2019.
//  Copyright © 2019 Andre Gustavo. All rights reserved.
//

import Foundation

protocol Card {
    var name: String { get }
    var direction: GameDirection { get }
    
    func discardPriority(pileCard: Card) -> DiscardPriority
}
