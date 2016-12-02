//
//  ListPeoplePresenter.swift
//  MyLife2
//
//  Created by Ivan Rublev on 12/2/16.
//  Copyright (c) 2016 Ivan Rublev. All rights reserved.
//

import UIKit

// MARK: Boundary protocol
protocol ListPeoplePresenterOutput: class {
    func displaySomething(_ viewModel: ListPeople.Response.ViewModel)
}

// MARK: Class
/**
    Class to format the data response from the Interactor and pass the result view model to the View Controller
 */
class ListPeoplePresenter: ListPeopleInteractorOutput {
    weak var output: ListPeoplePresenterOutput?
    
    // MARK: Presentation logic
    func presentSomething(_ response: ListPeople.Response) {
        let viewModel = ListPeople.Response.ViewModel()
        output?.displaySomething(viewModel)
    }
}
