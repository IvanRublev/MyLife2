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
    func doSomething(_ request: EditPerson.Request)
}

protocol EditPersonInteractorOutput {
    func presentSomething(_ response: EditPerson.Response)
}

// MARK: Class
/**
    Class to <#business#>.
 */
class EditPersonInteractor: EditPersonInteractorInput {
    var output: EditPersonInteractorOutput!
    
    // MARK: Business logic
    func doSomething(_ request: EditPerson.Request) {
        // NOTE: Create some Entity to do the work
        //let entity = EditPersonWorker()
        //entity.doSomeWork()
        
        // NOTE: Pass the result to the Presenter
        let response = EditPerson.Response()
        output.presentSomething(response)
    }
}
