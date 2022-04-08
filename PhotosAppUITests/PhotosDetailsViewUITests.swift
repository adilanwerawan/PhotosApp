//
//  PhotosDetailsViewUITests.swift
//  PhotosAppUITests
//
//  Created by MacBook on 08/04/2022.
//

import XCTest

class PhotosDetailsViewUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testNavigationTowardsDetailsView() throws {
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let app = XCUIApplication()
        app.launch()
        let element = app.scrollViews.children(matching: .other).element.children(matching: .other).element
        element.children(matching: .image).element(boundBy: 0).tap()
    }

}
