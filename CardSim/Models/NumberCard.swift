//
//  NumberCard.swift
//  CardSim
//
//  Created by Andre Gustavo on 11/06/2019.
//  Copyright © 2019 Andre Gustavo. All rights reserved.
//

import Foundation

struct NumberCard: Card {
    enum Color: String {
        case red
        case green
        case blue
        case yellow
    }
    
    enum Number: Int {
        case one
        case two
        case three
        case four
        case five
        case six
        case seven
        case eight
        case nine
    }
    
    var name: String {
        return "\(number.rawValue) \(color.rawValue)"
    }
    
    let direction: GameDirection = .continous
    
    let number: Number
    let color: Color
    
    init(number: Number, color: Color) {
        self.number = number
        self.color = color
    }
    
    func discardPriority(pileCard: Card) -> DiscardPriority {
        guard let numberedPileCard = pileCard as? NumberCard else {
            return .none
        }
        
        if numberedPileCard.color == color {
            return .highest
        }
        
        if numberedPileCard.number == number {
            return .high
        }
        
        return .none
    }
}
