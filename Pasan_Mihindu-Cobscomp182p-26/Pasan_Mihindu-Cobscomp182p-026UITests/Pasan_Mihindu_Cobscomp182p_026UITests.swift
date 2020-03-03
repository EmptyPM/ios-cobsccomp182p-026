//
//  Pasan_Mihindu_Cobscomp182p_026UITests.swift
//  Pasan_Mihindu-Cobscomp182p-026UITests
//
//  Created by Minu Jayakody on 2/13/20.
//  Copyright © 2020 Minu Jayakody. All rights reserved.
//

import XCTest

class Pasan_Mihindu_Cobscomp182p_026UITests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    func testValidloginsuccess(){
        
        let validPassword = "33pasan33##"
        let validEmail = "pmihindub7@gmail.com"
        
        
        let app = XCUIApplication()
        let tabBarsQuery = app.tabBars
        tabBarsQuery.buttons["Profile"].tap()
        
        let loginButton = app.buttons["Login"]
        loginButton.tap()
        let emailTextField = app.textFields["Email"]
        XCTAssertTrue(emailTextField.exists )
        
        emailTextField.tap()
        
        emailTextField.typeText(validEmail)
        
        
        let passwordSecureTextField = app.secureTextFields["Password"]
        XCTAssertTrue(passwordSecureTextField.exists)
        
        passwordSecureTextField.tap()
        
        
        passwordSecureTextField.tap()
        
        passwordSecureTextField.typeText(validPassword)
        loginButton.tap()
        tabBarsQuery.buttons["Event"].tap()
        
        
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    

}
