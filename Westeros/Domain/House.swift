//
//  House.swift
//  Westeros
//
//  Created by Eduardo on 6/9/18.
//  Copyright © 2018 Eduardo Jordan Muñoz. All rights reserved.
//

import Foundation

typealias Words = String
typealias Members = Set<Person>

final class House {
    let name: String
    let sigil: Sigil
    let words: Words
    let wikiUrl: URL
    private var _members: Members
    
    init(name: String, sigil: Sigil, words: Words, url: URL) {
        self.name = name
        self.sigil = sigil
        self.words = words
        self.wikiUrl = url
        self._members = Members()
    }
}


extension House {
    var count: Int {
        return _members.count
    }
    
    func add(person: Person) {
        guard self == person.house else {
            return
        }
        
        _members.insert(person)
    }
    
    func add(persons: Person...) {
        persons.forEach { add(person: $0) }
    }
    
}

extension House {
    var proxyForEquality: String {
        return "\(words)\(name)\(count)"
    }
    
    var proxyForComparison: String {
        return name.uppercased()
    }
}

extension House: Equatable {
    static func ==(lhs: House, rhs: House) -> Bool {
        return lhs.proxyForEquality == rhs.proxyForEquality
    }
}

extension House: Hashable {
    
    var hashValue: Int {
        return proxyForEquality.hashValue
    }
}

extension House: Comparable {
    static func < (lhs: House, rhs: House) -> Bool {
        // Orden alfabetico
        return lhs.proxyForComparison < rhs.proxyForComparison
    }
}
