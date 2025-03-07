//
//  WordleUITestsLaunchTests.swift
//  WordleUITests
//
//  Created by Mari Batilando on 2/12/23.
//

import XCTest

final class WordleUITestsLaunchTests: XCTestCase {

    override class var runsForEachTargetApplicationUIConfiguration: Bool {
        true
    }

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    func testLaunch() throws {
        let app = XCUIApplication()
                app.launch()
                
               
                let startGameButton = app.buttons["Start Game"]
                if startGameButton.waitForExistence(timeout: 5) {
                    startGameButton.tap()
                }
                
                
                let gameBoard = app.otherElements["GameBoard"]
                XCTAssertTrue(gameBoard.waitForExistence(timeout: 5), "The game board should appear after tapping Start Game.")
                
                let attachment = XCTAttachment(screenshot: app.screenshot())
                attachment.name = "Launch Screen"
                attachment.lifetime = .keepAlways
                add(attachment)
            }
}
