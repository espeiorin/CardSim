//
//  DefaultGameController.swift
//  CardSim
//
//  Created by Andre Gustavo on 11/06/2019.
//  Copyright © 2019 Andre Gustavo. All rights reserved.
//

import Foundation

final class DefaultGameController {
    
    private var players = [Player]()
    private var pile = [NumberCard]()
    
    private var topOfThePile: NumberCard {
        // there should be always at least 1 card at the pile
        return pile.last!
    }
    
    private func moveForward(currentPlayer: Int) -> Int {
        let nextPlayer = currentPlayer + 1
        
        guard nextPlayer < players.count else {
            return 0
        }
        
        return nextPlayer
    }
    
    private func moveBackward(currentPlayer: Int) -> Int {
        let nextPlayer = currentPlayer - 1
        
        guard nextPlayer >= 0 else {
            return (players.count - 1)
        }
        
        return nextPlayer
    }
}

extension DefaultGameController: GameController {
    func startGame(players: [Player], startingCard: NumberCard) throws -> Player {
        guard players.count > 1 else {
            throw GameError.invalidUserCount
        }
        self.players = players
        self.pile = [startingCard]
        
        var winner: Player?
        var playerOffset = 0
        var isMovingForward = true
        var moveFunction: (Int) -> Int = moveForward(currentPlayer:)
        
        var countSinceLastDiscard = 0
        let possibleMovesWithoutDiscard = players.count
        
        while winner == nil {
            guard countSinceLastDiscard < possibleMovesWithoutDiscard else {
                throw GameError.stalled
            }
            
            let player = players[playerOffset]
            if let removedCard = player.play(pileCard: topOfThePile) {
                countSinceLastDiscard = 0
                
                if let numberCard = removedCard as? NumberCard {
                    pile.append(numberCard)
                }
                
                if player.cardCount == 0 {
                    winner = player
                    break
                }
                
                if removedCard.direction == .reverse {
                    isMovingForward = !isMovingForward
                    if isMovingForward {
                        moveFunction = moveForward(currentPlayer:)
                    } else {
                        moveFunction = moveBackward(currentPlayer:)
                    }
                }
                
                playerOffset = moveFunction(playerOffset)
            }
            countSinceLastDiscard += 1
        }
        
        return winner!
    }
}
