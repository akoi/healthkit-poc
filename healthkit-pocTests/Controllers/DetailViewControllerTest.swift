//
//  DetailViewControllerTest.swift
//  healthkit-poc
//

import UIKit
import XCTest
import HealthKit

class DetailViewControllerTest: XCTestCase {

    var vc: DetailViewController!
    let itemName = "Steps"
    let itemIdentifier = HKQuantityTypeIdentifierStepCount
    
    override func setUp() {
        super.setUp()
        
        var storyboard: UIStoryboard! = UIStoryboard(name: "Main", bundle: NSBundle(forClass: self.dynamicType))
        vc = storyboard.instantiateViewControllerWithIdentifier("detailView") as DetailViewController
        
        let item = HealthItem { item in
            item.name = self.itemName
            item.hkIdentifier = self.itemIdentifier
        }
        vc.item = item
        vc.loadView()
    }
    
    override func tearDown() {
        super.tearDown()
    }

    func testViewDidLoad() {
        vc.viewDidLoad()
        let item = vc.item
        XCTAssertNotNil(item, "Nil item found in view controller.")
        XCTAssertEqual(item!.name, itemName, "HealthItem has wrong name. Expected: \(itemName), Actual: \(item!.name)")
        XCTAssertEqual(item!.hkIdentifier, itemIdentifier, "HealthItem has wrong name. Expected: \(itemIdentifier), Actual: \(item!.hkIdentifier)")
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock() {
            self.vc.viewDidLoad()
        }
    }

}
