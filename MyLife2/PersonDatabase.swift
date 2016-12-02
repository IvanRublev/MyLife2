//
//  PersonDatabase.swift
//  MyLife2
//
//  Created by Ivan Rublev on 12/2/16.
//  Copyright © 2016 Ivan Rublev. All rights reserved.
//

import UIKit

struct PersonDatabase {
    private var persons: [Person] = [
        Person(name: "Byte",
               image: UIImage(named: "Sample1"),
               dogPreference: 9.0),
        Person(name: "Blu",
               image: UIImage(named: "Sample2"),
               dogPreference: 6.0),
        Person(name: "Hopper",
               image: UIImage(named: "Sample3"),
               dogPreference: 2.0)
    ]
    
    func all() -> [Person] {
        return persons
    }
    
    subscript(index: Int) -> Person {
        get {
            return persons[index]
        }
        set(newValue) {
            persons[index] = newValue
        }
    }
    
    mutating func add(person: Person) {
        persons.append(person)
    }
}
