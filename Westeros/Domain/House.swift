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
    private var _members: Members
    
    init(name: String, sigil: Sigil, words: Words) {
        self.name = name
        self.sigil = sigil
        self.words = words
        self._members = Members()
    }
}


extension House {
    var count: Int {
        return _members.count
    }
    
    func add(person: Person) {
        _members.insert(person)
    }
}
