//
//  HealthStoreProviderTest.swift
//  healthkit-poc
//

import XCTest

class HealthStoreProviderTest: XCTestCase {

    var provider: HealthStoreProvider!
    
    override func setUp() {
        super.setUp()
        
        provider = HealthStoreProvider.sharedInstance
    }
    
    override func tearDown() {
        super.tearDown()
    }

    func testIsSingleton() {
        let newProvider: HealthStoreProvider! = HealthStoreProvider.sharedInstance
        XCTAssertTrue(newProvider === provider, "Providers do not reference the same object instance")
    }
    
    func testHealthStoreAvailable() {
        let healthStore = provider.healthStore?
        XCTAssertNotNil(healthStore, "HealthStore was nil")
    }

}
