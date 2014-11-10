//
//  HealthItem.swift
//  healthkit-poc
//

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