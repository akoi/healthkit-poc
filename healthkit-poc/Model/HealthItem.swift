//
//  HealthItem.swift
//  healthkit-poc
//
//  Created by Anton Bagchi on 06/11/2014.
//  Copyright (c) 2014 AKOI Solutions AB. All rights reserved.
//

import Foundation

protocol HealthItemProtocol {
    var name: String! { get }
    var hkIdentifier: String! { get }
}

class HealthItem: HealthItemProtocol {
    var name: String!
    var hkIdentifier: String!
    
    typealias buildHealthItemClosure = (HealthItem)-> Void
    
    init(build: buildHealthItemClosure) {
        build(self)
    }
}