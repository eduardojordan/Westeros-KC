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
        
        guard self.name == person.house.name else {
            return
        }
        _members.insert(person)
    }
}

extension House {
    var proxyforEquality: String{
        return "\(name)\(words)\(count)"
    }
    
    var proxyForComparison : String {
        return name.uppercased()
    }
}

extension House: Equatable{
    static func == (lhs: House, rhs: House) -> Bool {
    return lhs.proxyforEquality == rhs.proxyforEquality
    
  }
}

extension House : Hashable {
    
    var hashValue : Int {
        return proxyforEquality.hashValue

   }
}

    extension House : Comparable {
        static func < (lhs: House, rhs: House) -> Bool {
            //Orden alfabetico
            return lhs.proxyForComparison < rhs.proxyForComparison
            
            
        }
}
