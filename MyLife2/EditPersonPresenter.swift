//
//  EditPersonPresenter.swift
//  MyLife2
//
//  Created by Ivan Rublev on 12/2/16.
//  Copyright (c) 2016 Ivan Rublev. All rights reserved.
//

import UIKit

// MARK: Boundary protocol
protocol EditPersonPresenterOutput: class {
    func displaySomething(_ viewModel: EditPerson.Response.ViewModel)
}

// MARK: Class
/**
    Class to format the data response from the Interactor and pass the result view model to the View Controller
 */
class EditPersonPresenter: EditPersonInteractorOutput {
    weak var output: EditPersonPresenterOutput?
    
    // MARK: Presentation logic
    func presentSomething(_ response: EditPerson.Response) {
        let viewModel = EditPerson.Response.ViewModel()
        output?.displaySomething(viewModel)
    }
}
