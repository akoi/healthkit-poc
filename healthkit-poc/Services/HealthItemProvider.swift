//
//  HealthItemService.swift
//  healthkit-poc
//

import HealthKit

class HealthItemProvider {
    
    class var sharedInstance : HealthItemProvider {
        struct Static {
            static let instance : HealthItemProvider = HealthItemProvider()
        }
        return Static.instance
    }

    func findByIdentifier(identifier: String)-> HealthItem? {
        return healthItems.filter { $0.hkIdentifier == identifier }.first
    }
    
    func findByName(name: String)-> HealthItem? {
        // assumes unique name
        return healthItems.filter { $0.name == name }.first
    }
    
    let healthItems: Array<HealthItem> = [
        // Nutrition TODO
        HealthItem { item in
            item.name = "Caffeine"
            item.hkIdentifier = HKQuantityTypeIdentifierDietaryCaffeine
        },
        // Vitals
        HealthItem { item in
            item.name = "Heart Rate"
            item.hkIdentifier = HKQuantityTypeIdentifierHeartRate
        },
        // Fitness
        HealthItem { item in
            item.name = "Steps"
            item.hkIdentifier = HKQuantityTypeIdentifierStepCount
        },
        // Body Measurements
        HealthItem { item in
            item.name = "Weight"
            item.hkIdentifier = HKQuantityTypeIdentifierBodyMass
        }
    ]
}