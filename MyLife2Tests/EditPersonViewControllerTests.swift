//
//  EditPersonViewControllerTests.swift
//  MyLife2
//
//  Created by Ivan Rublev on 12/3/16.
//  Copyright (c) 2016 Ivan Rublev. All rights reserved.
//

@testable import MyLife2
import Quick
import Nimble

class EditPersonViewControllerTests: QuickSpec {
    // MARK: Mock
    class OutputMock: EditPersonInteractorInput {
        var receivedRequest: EditPerson.Request?
        var showPersonDataWasCalled = false
        
        func showPersonData(_ request: EditPerson.Request) {
            showPersonDataWasCalled = true
            receivedRequest = request
        }
        
        var validatePersonDataWasCalled = false
        
        func validatePersonData(_ request: EditPerson.Request) -> Bool {
            validatePersonDataWasCalled = true
            receivedRequest = request
            return true
        }
        
        var updatePersonDataWasCalled = false
        
        func updatePersonData(_ request: EditPerson.Request) {
            updatePersonDataWasCalled = true
            receivedRequest = request
        }
    }
    
    // MARK: Cases
    override func spec() {
        let bundle = Bundle.main
        let storyboard = UIStoryboard(name: "Main", bundle: bundle)

        var viewController: EditPersonViewController!
        var output: OutputMock!
        beforeEach {
            viewController = storyboard.instantiateViewController(withIdentifier: "EditPersonViewController") as! EditPersonViewController
            output = OutputMock()
            
            viewController.output = output
        }
        describe("The view load") {
            var window: UIWindow!
            beforeEach {
                viewController.personIdentifier = 0
                window = UIWindow()
                window.addSubview(viewController.view)
                viewController.beginAppearanceTransition(true, animated: false) // Triggers .viewWillAppear() and .viewDidAppear() events.
                viewController.endAppearanceTransition()
            }
            afterEach {
                viewController.view.removeFromSuperview()
            }
            it("makes output to do show persons data.") {
                expect(output.showPersonDataWasCalled) == true
            }
            context("After view is loaded") {
                describe("Name entered in text field") {
                    let newName = "newName"
                    beforeEach {
                        viewController.nameTextField.text = newName
                        let _ = viewController.textFieldShouldReturn(viewController.nameTextField)
                    }
                    it("makes output to validate data.") {
                        expect(output.validatePersonDataWasCalled) == true
                        expect(output.receivedRequest!.name) == newName
                    }
                }
                describe("Unwind segue is performed") {
                    beforeEach {
                        let _ = viewController.shouldPerformSegue(withIdentifier: "unwind", sender: viewController)
                    }
                    it("makes to validate then update the person's data.") {
                        expect(output.validatePersonDataWasCalled) == true
                        expect(output.updatePersonDataWasCalled) == true
                    }
                }
                describe("Asked to display preson") {
                    var viewModel: EditPerson.Response.ViewModel!
                    let name = "Name"
                    let dogPreference: Float = 0.8
                    beforeEach {
                        viewModel = EditPerson.Response.ViewModel(name: name, nameAsteriskHidden: true, image: nil, dogPreference: dogPreference)
                        viewController.displayPerson(viewModel)
                    }
                    it("makes subviews to display data.") {
                        expect(viewController.nameTextField.text) == name
                        expect(viewController.preferenceSlider.value).to(beCloseTo(dogPreference))
                    }
                }
                describe("Asked to display validation error") {
                    var viewModel: EditPerson.Response.ViewModel!
                    let asteriskHidden = false
                    beforeEach {
                        viewModel = EditPerson.Response.ViewModel(name: nil, nameAsteriskHidden: asteriskHidden, image: nil, dogPreference: nil)
                        viewController.displayValidationError(viewModel)
                    }
                    it("makes asterisk subview to be not hidden.") {
                        expect(viewController.nameAsterisk.isHidden) == asteriskHidden
                    }
                }
            }
        }
    }
}
