//
//  EditPersonInteractor.swift
//  MyLife2
//
//  Created by Ivan Rublev on 12/2/16.
//  Copyright (c) 2016 Ivan Rublev. All rights reserved.
//

import UIKit

// MARK: Boundary protocols
protocol EditPersonInteractorInput {
    func showPersonData(_ request: EditPerson.Request)
    func validatePersonData(_ request: EditPerson.Request) -> Bool
    func updatePersonData(_ request: EditPerson.Request)
}

protocol EditPersonInteractorOutput {
    func presentPersonData(_ response: EditPerson.Response)
    func presentValidationError(_ response: EditPerson.Response)
}

// MARK: Class
/**
 Class to edit person's data.
 */
class EditPersonInteractor: EditPersonInteractorInput {
    var output: EditPersonInteractorOutput!
    var persons: PersonDatabase!
    
    // MARK: Business logic
    func showPersonData(_ request: EditPerson.Request) {
        let aPerson = persons[request.identifier!]
        
        let response = EditPerson.Response(name: aPerson.name,
                                           nameIsValid: true,
                                           image: aPerson.image,
                                           dogPreference: aPerson.dogPreference)
        output.presentPersonData(response)
    }
    
    func validatePersonData(_ request: EditPerson.Request) -> Bool {
        let nameIsValid = (request.name.characters.count > 0)
        
        let response = EditPerson.Response(name: nil, nameIsValid: nameIsValid, image: nil, dogPreference: nil)
        output.presentValidationError(response)
        
        return nameIsValid
    }
    
    func updatePersonData(_ request: EditPerson.Request) {
        guard let identifier = request.identifier else {
            let newPerson = Person(name: request.name, image: UIImage(named: "DefaultImage"), dogPreference: request.dogPreference)
            persons.add(person: newPerson)
            print("New Person is added!")
            return
        } // otherwise update existing preson
        
        var aPerson = persons[identifier]
        
        aPerson.name = request.name
        aPerson.dogPreference = request.dogPreference
        
        persons[identifier] = aPerson
        print("Person is updated!")
    }
    
    // MARK: Response maker
}
