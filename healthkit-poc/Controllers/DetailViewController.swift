//
//  DetailViewController.swift
//  healthkit-poc
//

import UIKit
import HealthKit

class DetailViewController: UIViewController {

    let healthStore = HealthStoreProvider.sharedInstance.healthStore
    var item: HealthItem?
    
    @IBOutlet weak var sampleSizeLbl: UILabel!
    @IBOutlet weak var queryIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        loadSamples()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
 
    private func loadSamples() {
        if let i = item? {
            let name = i.name
            let sample = HKSampleType.quantityTypeForIdentifier(i.hkIdentifier)
            let query = HKSampleQuery(sampleType: sample, predicate: nil, limit: Int(HKObjectQueryNoLimit), sortDescriptors: nil) {
                query, results, error in
                
                if error != nil {
                    // Perform proper error handling here...
                    println("An error occured while fetching \(name) samples. \(error.localizedDescription)")
                    self.sampleSizeLbl.text = "0"
                    self.queryIndicator.stopAnimating()
                    self.sampleSizeLbl.hidden = false
                } else {
                    dispatch_async(dispatch_get_main_queue()) {
                        println("Found \(results.count) samples for \(name)")
                        self.sampleSizeLbl.text = String(results.count)
                        self.queryIndicator.stopAnimating()
                        self.sampleSizeLbl.hidden = false
                    }
                }
            }
            
            self.healthStore!.executeQuery(query)
        }
    }
}
