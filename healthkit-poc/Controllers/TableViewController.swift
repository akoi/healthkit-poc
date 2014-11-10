//
//  TableViewController.swift
//  healthkit-poc
//

import UIKit

class TableViewController: UITableViewController {

    let cellIdentifier = "healthItemCell"
    
    let healthStoreProvider = HealthStoreProvider.sharedInstance
    var healthItems: Array<HealthItem>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        healthItems = HealthItemProvider.sharedInstance.healthItems
        
        healthStoreProvider.requestAuthorizationForHealthItems(healthItems)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return healthItems.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as UITableViewCell

        // Configure the cell...
        cell.textLabel.text = healthItems[indexPath.row].name

        return cell
    }

    // MARK: - Navigation

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        var viewController = segue.destinationViewController as DetailViewController
        
        let indexPath = self.tableView.indexPathForSelectedRow()!
        let item = self.healthItems[indexPath.row]
        viewController.title = item.name
        viewController.item = item
    }

}
