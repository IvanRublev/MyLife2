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
    func doSomething(_ request: ListPeople.Request)
}

protocol ListPeopleInteractorOutput {
    func presentSomething(_ response: ListPeople.Response)
}

// MARK: Class
/**
    Class to <#business#>.
 */
class ListPeopleInteractor: ListPeopleInteractorInput {
    var output: ListPeopleInteractorOutput!
    
    // MARK: Business logic
    func doSomething(_ request: ListPeople.Request) {
        // NOTE: Create some Entity to do the work
        //let entity = ListPeopleWorker()
        //entity.doSomeWork()
        
        // NOTE: Pass the result to the Presenter
        let response = ListPeople.Response()
        output.presentSomething(response)
    }
}
