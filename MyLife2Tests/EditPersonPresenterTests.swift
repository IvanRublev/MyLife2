//
//  EditPersonPresenterTests.swift
//  MyLife2
//
//  Created by Ivan Rublev on 12/3/16.
//  Copyright (c) 2016 Ivan Rublev. All rights reserved.
//

@testable import MyLife2
import Quick
import Nimble

class EditPersonPresenterTests: QuickSpec {
    // MARK: Mock
    class OutputMock: EditPersonPresenterOutput {
        var receivedViewModel: EditPerson.Response.ViewModel?
        var displayPersonWasCalled = false
        
        func displayPerson(_ viewModel: EditPerson.Response.ViewModel) {
            displayPersonWasCalled = true
            receivedViewModel = viewModel
        }
        
        var displayValidationErrorWasCalled = false
        
        func displayValidationError(_ viewModel: EditPerson.Response.ViewModel) {
            displayValidationErrorWasCalled = true
            receivedViewModel = viewModel
        }
    }

    override func spec() {
        var presenter: EditPersonPresenter!
        var output: OutputMock!
        
        beforeEach {
            presenter = EditPersonPresenter()
            output = OutputMock()
            
            presenter.output = output
        }
        describe("Asked to present person data") {
            var response: EditPerson.Response!
            beforeEach {
                response = EditPerson.Response(name: "Name", nameIsValid: true, image: nil, dogPreference: 0.2)
                presenter.presentPersonData(response)
            }
            it("makes view controller to display preson data.") {
                expect(output.displayPersonWasCalled) == true
                let viewModel = output.receivedViewModel!
                expect(viewModel.name) == response.name
                expect(viewModel.nameAsteriskHidden) == response.nameIsValid
                expect(viewModel.image).to(beNil())
                expect(viewModel.dogPreference) == response.dogPreference
            }
        }
        describe("Asked to present validation error") {
            var response: EditPerson.Response!
            beforeEach {
                response = EditPerson.Response(name: "", nameIsValid: false, image: nil, dogPreference: 0.2)
                presenter.presentValidationError(response)
            }
            it("makes view controller to display preson data.") {
                expect(output.displayValidationErrorWasCalled) == true
                let viewModel = output.receivedViewModel!
                expect(viewModel.name) == response.name
                expect(viewModel.nameAsteriskHidden) == response.nameIsValid
                expect(viewModel.image).to(beNil())
                expect(viewModel.dogPreference) == response.dogPreference
            }
        }
    }
}
