//
//  WordleUITests.swift
//  WordleUITests
//
//  Created by Mari Batilando on 2/12/23.
//

import XCTest

final class WordleUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // UI tests must launch the application that they test.
                let app = XCUIApplication()
                app.launch()
                
                // Verify that the "Start Game" button exists on the launch screen.
                let startGameButton = app.buttons["Start Game"]
                XCTAssertTrue(startGameButton.waitForExistence(timeout: 5), "The 'Start Game' button should exist on launch")
                
                // Tap the "Start Game" button to navigate into the game.
                startGameButton.tap()
                
                // Verify that the game board appears after tapping the button.
                let gameBoard = app.otherElements["GameBoard"]
                XCTAssertTrue(gameBoard.waitForExistence(timeout: 5), "The game board should appear after starting the game")
                
                // Optionally, check that a specific row (e.g., the first row) exists in the game board.
                let firstRow = gameBoard.descendants(matching: .other).matching(identifier: "Row0").element
                XCTAssertTrue(firstRow.exists, "The first row of the game board should exist after starting the game")
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
