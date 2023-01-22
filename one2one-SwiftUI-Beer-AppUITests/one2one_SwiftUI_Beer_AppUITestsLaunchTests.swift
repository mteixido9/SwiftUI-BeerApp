//
//  one2one_SwiftUI_Beer_AppUITestsLaunchTests.swift
//  one2one-SwiftUI-Beer-AppUITests
//
//  Created by Marc  Teixidó Carrera on 16/1/23.
//

import XCTest

class one2one_SwiftUI_Beer_AppUITestsLaunchTests: XCTestCase {

    override class var runsForEachTargetApplicationUIConfiguration: Bool {
        true
    }

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    func testLaunch() throws {
        let app = XCUIApplication()
        app.launch()

        // Insert steps here to perform after app launch but before taking a screenshot,
        // such as logging into a test account or navigating somewhere in the app

        let attachment = XCTAttachment(screenshot: app.screenshot())
        attachment.name = "Launch Screen"
        attachment.lifetime = .keepAlways
        add(attachment)
    }
}