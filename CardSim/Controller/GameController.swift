//
//  GameController.swift
//  CardSim
//
//  Created by Andre Gustavo on 11/06/2019.
//  Copyright © 2019 Andre Gustavo. All rights reserved.
//

import Foundation

protocol GameController {
    func startGame(players: [Player], startingCard: NumberCard) throws -> Player
}
