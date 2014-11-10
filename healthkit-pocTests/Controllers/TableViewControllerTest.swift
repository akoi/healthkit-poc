//
//  TableViewControllerTest.swift
//  healthkit-poc
//

import UIKit
import XCTest

class TableViewControllerTest: XCTestCase {

    var vc: TableViewController!
    
    override func setUp() {
        super.setUp()
        
        var storyboard: UIStoryboard! = UIStoryboard(name: "Main", bundle: NSBundle(forClass: self.dynamicType))
        vc = storyboard.instantiateViewControllerWithIdentifier("healthItemsView") as TableViewController
        vc.loadView()
        vc.viewDidLoad()
    }
    
    override func tearDown() {
        super.tearDown()
    }

    func testViewDidLoad() {
        let items = vc.healthItems
        // Using XCTAssertNotNil fails here(?), so check for != nil
        XCTAssertTrue(items != nil, "View Controller failed to load healthItems.")
        XCTAssertNotNil(vc.healthStoreProvider, "View Controller failed to load healthStoreProvider.")
    }
    
    func testTableContents() {
        let tableView = vc.tableView
        let sections = tableView.numberOfSections()
        XCTAssertEqual(sections, 1, "Incorrect number of sections in tableView. Expected: 1, Actual: \(sections)")
        
        let rows = tableView.numberOfRowsInSection(0)
        XCTAssertEqual(rows, 4, "Incorrect number of rows in section. Expected: 4, Actual: \(rows)")
        
        let indexPath = NSIndexPath(forRow: 0, inSection: 0)
        let cell: UITableViewCell? = tableView.cellForRowAtIndexPath(indexPath)
        XCTAssertNotNil(cell, "Cell was nil")
        let identifier = cell?.reuseIdentifier?
        XCTAssertNotNil(identifier, "No cell identifier found.")
        XCTAssertEqual(identifier!, vc.cellIdentifier, "Wrong identifier on cell. Expected: \(vc.cellIdentifier), Actual: \(identifier!)")
    }

}
