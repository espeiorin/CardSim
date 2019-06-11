//
//  DiscardPriority.swift
//  CardSim
//
//  Created by Andre Gustavo on 11/06/2019.
//  Copyright © 2019 Andre Gustavo. All rights reserved.
//

import Foundation

enum DiscardPriority: Int, Comparable {
    case highest = 2
    case high = 1
    case medium = 0
    case none = -1
    
    static func < (lhs: DiscardPriority, rhs: DiscardPriority) -> Bool {
        return lhs.rawValue < rhs.rawValue
    }
}
