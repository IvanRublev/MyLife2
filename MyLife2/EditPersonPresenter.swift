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
    func displayPerson(_ viewModel: EditPerson.Response.ViewModel)
    func displayValidationError(_ viewModel: EditPerson.Response.ViewModel)
}

// MARK: Class
/**
    Class to format the data response from the Interactor and pass the result view model to the View Controller
 */
class EditPersonPresenter: EditPersonInteractorOutput {
    weak var output: EditPersonPresenterOutput?
    
    // MARK: Presentation logic
    func presentPersonData(_ response: EditPerson.Response) {
        output?.displayPerson(viewModel(response))
    }
    
    func presentValidationError(_ response: EditPerson.Response) {
        output?.displayValidationError(viewModel(response))
    }
    
    // MARK: Helper
    func viewModel(_ response: EditPerson.Response) -> EditPerson.Response.ViewModel {
        return EditPerson.Response
            .ViewModel(name: response.name,
                       nameAsteriskHidden: response.nameIsValid,
                       image: response.image,
                       dogPreference: response.dogPreference)
    }
}
