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
    Class to <#business#>.
 */
class ListPeopleInteractor: ListPeopleInteractorInput {
    var output: ListPeopleInteractorOutput!
    
    // MARK: Business logic

}
