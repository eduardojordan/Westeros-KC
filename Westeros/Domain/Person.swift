//
//  Character.swift
//  Westeros
//
//  Created by Eduardo on 6/9/18.
//  Copyright © 2018 Eduardo Jordan Muñoz. All rights reserved.
//

import Foundation

final class Person {
    
    // Mark: - Properties
    let name: String
    let house: House
    private let _alias: String?
    
    var alias: String {
        get{
   
            return _alias ?? "" // Devuelveme _alias, si hay algo, y si no, ""
        }
    }
    
    // Mark: - Initialization
    init(name: String, alias: String? = nil, house: House) {
        self.name = name
        self._alias = alias
        self.house = house
    }
}

extension Person {
    var fullName: String {
        return "\(name) \(house.name)"
    }
}

extension Person { // Identificar inequivocamnete una persona
    var proxyForEquality: String {
        return "\(name)\(alias)\(house.name)"
    }
    var proxyForComparison: String { // ordenar
        return fullName.uppercased()
    }
}

extension Person: Hashable {
    var hashValue: Int {
        return proxyForEquality.hashValue
    }
}

extension Person: Equatable {
    static func ==(lhs: Person, rhs: Person) -> Bool {
        return lhs.proxyForEquality == rhs.proxyForEquality
    }
    
}

extension Person : Comparable {
    static func < (lhs: Person, rhs: Person) -> Bool{
        return lhs.proxyForComparison < rhs.proxyForComparison
}

}
