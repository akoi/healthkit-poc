//
//  HealthItemTest.swift
//  healthkit-poc
//

import UIKit
import XCTest

class HealthItemTest: XCTestCase {

    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }

    func testCreate() {
        let name = "Test"
        let identifier = "hkTestIdentifier"
        let healthItem = HealthItem { item in
            item.name = name
            item.hkIdentifier = identifier
        }
        XCTAssertTrue(healthItem.name == name, "Wrong name. Expected: \(name), Actual: \(healthItem.name)")
        XCTAssertTrue(healthItem.hkIdentifier == identifier, "Wrong identifier. Expected: \(identifier), Actual: \(healthItem.name)")
    }

}
