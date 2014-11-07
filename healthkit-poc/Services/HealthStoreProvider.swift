//
//  HealthStoreService.swift
//  healthkit-poc
//

import HealthKit

class HealthStoreProvider {
    
    // initialise singleton
    class var sharedInstance : HealthStoreProvider {
        struct Static {
            static let instance : HealthStoreProvider = HealthStoreProvider()
        }
        return Static.instance
    }
    
    let healthStore:HKHealthStore?
    
    init() {
        if (HKHealthStore.isHealthDataAvailable()) {
            self.healthStore = HKHealthStore()
        } else {
            println("HealthStore Data Unavailable")
        }
    }
    
    func requestAuthorizationForHealthItems(items: Array<HealthItem>) {
        if let hs = healthStore? {
            
            var dataTypesToRead = Array<HKQuantityType>()
            for item in items {
                if let quantityType = HKQuantityType.quantityTypeForIdentifier(item.hkIdentifier) {
                    dataTypesToRead.append(quantityType)
                }
            }
            
            hs.requestAuthorizationToShareTypes(nil,
                readTypes: NSSet(array: dataTypesToRead), completion: {
                    (success, error) in
                    if (success) {
                        println("Completed HealthStore authorization")
                    } else {
                        println("HealthStore authorization failed")
                    }
            })
        } else {
            println("HealthStore data unavailable")
        }
    }
}