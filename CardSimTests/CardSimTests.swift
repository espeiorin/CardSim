//
//  CardSimTests.swift
//  CardSimTests
//
//  Created by Andre Gustavo on 11/06/2019.
//  Copyright © 2019 Andre Gustavo. All rights reserved.
//

import XCTest
@testable import CardSim

class CardSimTests: XCTestCase {
    
    var game: GameController!

    override func setUp() {
        game = DefaultGameController()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testHappyExampleGame() {
        let bob = Player(name: "Bob",
                         cardA: NumberCard(number: .two, color: .red),
                         cardB: NumberCard(number: .four, color: .yellow),
                         cardC: ReverseCard())
        
        let alice = Player(name: "Alice",
                           cardA: NumberCard(number: .two, color: .green),
                           cardB: ReverseCard(),
                           cardC: NumberCard(number: .six, color: .red))
        let carol = Player(name: "Carol",
                           cardA: NumberCard(number: .six, color: .blue),
                           cardB: NumberCard(number: .eight, color: .blue),
                           cardC: NumberCard(number: .eight, color: .green))
        
        do {
            let winner = try game.startGame(players: [bob, alice, carol], startingCard: NumberCard(number: .five, color: .red))
            XCTAssert(winner === carol)
        } catch {
            XCTAssert(false)
        }
    }
    
    func testSinglePlayerScenario() {
        let bob = Player(name: "Bob",
                         cardA: NumberCard(number: .two, color: .red),
                         cardB: NumberCard(number: .four, color: .yellow),
                         cardC: ReverseCard())
        do {
            let _ = try game.startGame(players: [bob], startingCard: NumberCard(number: .five, color: .red))
            XCTAssert(false)
        } catch GameError.invalidUserCount {
            XCTAssert(true)
        } catch {
            XCTAssert(false)
        }
    }
    
    func testStalledGameScenario() {
        let bob = Player(name: "Bob",
                         cardA: NumberCard(number: .two, color: .red),
                         cardB: NumberCard(number: .four, color: .yellow),
                         cardC: ReverseCard())
        
        let alice = Player(name: "Alice",
                           cardA: NumberCard(number: .two, color: .green),
                           cardB: ReverseCard(),
                           cardC: NumberCard(number: .six, color: .red))
        let carol = Player(name: "Carol",
                           cardA: NumberCard(number: .six, color: .blue),
                           cardB: ReverseCard(),
                           cardC: NumberCard(number: .eight, color: .green))
        
        do {
            let _ = try game.startGame(players: [bob, alice, carol], startingCard: NumberCard(number: .five, color: .red))
            XCTAssert(false)
        } catch GameError.stalled {
            XCTAssert(true)
        } catch {
            XCTAssert(false)
        }
    }
}
