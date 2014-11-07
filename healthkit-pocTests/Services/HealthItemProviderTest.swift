//
//  HealthItemProviderTest.swift
//  healthkit-poc
//

import UIKit
import XCTest
import HealthKit

class HealthItemProviderTest: XCTestCase {

    var provider: HealthItemProvider!
    
    override func setUp() {
        super.setUp()
        
        provider = HealthItemProvider.sharedInstance
    }
    
    override func tearDown() {
        super.tearDown()
    }

    func testIsSingleton() {
        let newProvider = HealthItemProvider.sharedInstance
        XCTAssertTrue(newProvider === provider, "Providers do not reference the same object instance")
    }
    
    func testHealthItemsCount() {
        let healthItems = provider.healthItems
        XCTAssertEqual(healthItems.count, 4, "Incorrect number of health items. Expected: 4, Actual: \(healthItems.count)")
    }
    
    func testFindHealthItemByName() {
        let name = "Steps"
        let item = provider.findByName(name)
        XCTAssertNotNil(item, "No healthItem found with name: \(name)")
        
        let unknownName = "Unknown"
        let unknownItem = provider.findByName(unknownName)
        XCTAssertNil(unknownItem, "HealthItem returned for unknown name: \(unknownName)")
    }
    
    func testFindHealthItemByIdentifier() {
        let identifier = HKQuantityTypeIdentifierStepCount
        let item = provider.findByIdentifier(identifier)
        XCTAssertNotNil(item, "No healthItem found with identifier: \(identifier)")
        
        let unknownIdentifier = "Unknown"
        let unknownItem = provider.findByName(unknownIdentifier)
        XCTAssertNil(unknownItem, "HealthItem returned for unknown name: \(unknownIdentifier)")
    }

}
