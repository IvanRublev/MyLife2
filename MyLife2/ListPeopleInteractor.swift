//
//  ListPeopleInteractor.swift
//  MyLife2
//
//  Created by Ivan Rublev on 12/2/16.
//  Copyright (c) 2016 Ivan Rublev. All rights reserved.
//

import UIKit

// MARK: Boundary protocols
protocol ListPeopleInteractorInput {
    func showPeopleList(_ request: ListPeople.Request)
}

protocol ListPeopleInteractorOutput {
    func presentList(_ response: ListPeople.Response)
}

// MARK: Class
/**
 Class to list people.
 */
class ListPeopleInteractor: ListPeopleInteractorInput {
    var output: ListPeopleInteractorOutput!
    var persons: PersonDatabase!
    
    // MARK: Business logic
    func showPeopleList(_ request: ListPeople.Request) {
        let responseItems =
            persons.all().enumerated()
                .map { ListPeople.Response.Item(identifier: $0,
                                                name: $1.name,
                                                image: $1.image) }
        
        let response = ListPeople.Response(items: responseItems)
        output.presentList(response)
    }
}
