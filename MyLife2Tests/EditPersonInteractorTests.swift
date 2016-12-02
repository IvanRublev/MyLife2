//
//  EditPersonInteractorTests.swift
//  MyLife2
//
//  Created by Ivan Rublev on 12/3/16.
//  Copyright (c) 2016 Ivan Rublev. All rights reserved.
//

@testable import MyLife2
import Quick
import Nimble

class EditPersonInteractorTests: QuickSpec {
    // MARK: Mock
    class OutputMock: EditPersonInteractorOutput {
        var receivedResponse: EditPerson.Response?
        var presentPersonDataWasCalled = false
        
        func presentPersonData(_ response: EditPerson.Response) {
            presentPersonDataWasCalled = true
            receivedResponse = response
        }
        
        var presentValidationErrorWasCalled = false
        
        func presentValidationError(_ response: EditPerson.Response) {
            presentValidationErrorWasCalled = true
            receivedResponse = response
        }
    }

    override func spec() {
        var interactor: EditPersonInteractor!
        var output: OutputMock!
        var database: PersonDatabase!

        beforeEach {
            interactor = EditPersonInteractor()
            output = OutputMock()
            database = PersonDatabase(persons: [Person(name: "Test1",
                                                       image: nil,
                                                       dogPreference: 9.0),
                                                Person(name: "Test2",
                                                       image: nil,
                                                       dogPreference: 6.0)])
            interactor.output = output
            interactor.persons = database
        }
        describe("Asked to show person data") {
            var request: EditPerson.Request!
            let identifier = 1
            beforeEach {
                request = EditPerson.Request(identifier: identifier)
                interactor.showPersonData(request)
            }
            it("makes output to present person's data.") {
                expect(output.presentPersonDataWasCalled) == true
                let response = output.receivedResponse!
                expect(response.name) == database[identifier].name
                expect(response.dogPreference) == database[identifier].dogPreference
            }
        }
        describe("Asked to validate persons data,") {
            var request: EditPerson.Request!
            var validationResult: Bool?
            context("when no name specified") {
                beforeEach {
                    request = EditPerson.Request(identifier: 0, name: "", dogPreference: 0.2)
                    validationResult = interactor.validatePersonData(request)
                }
                it("makes output to present validation error.") {
                    expect(validationResult) == false
                    expect(output.presentValidationErrorWasCalled) == true
                    expect(output.receivedResponse!.nameIsValid) == false
                }
            }
            context("when all data are correct") {
                beforeEach {
                    request = EditPerson.Request(identifier: 0, name: "newName", dogPreference: 0.2)
                    validationResult = interactor.validatePersonData(request)
                }
                it("makes output to present no validation error.") {
                    expect(validationResult) == true
                    expect(output.presentValidationErrorWasCalled) == true
                    expect(output.receivedResponse!.nameIsValid) == true
                }
            }
        }
        describe("Asked to update person's data,") {
            var request: EditPerson.Request!
            let newName = "Test3"
            let preference: Float = 0.3
            context("when identifier is set") {
                beforeEach {
                    request = EditPerson.Request(identifier: 1, name: newName, dogPreference: preference)
                    interactor.updatePersonData(request)
                }
                it("updates existing person in database") {
                    expect(database.all().count) == 2
                    let updatedPerson = database[1]
                    expect(updatedPerson.name) == newName
                    expect(updatedPerson.dogPreference).to(beCloseTo(preference))
                }
            }
            context("when no identifier is set") {
                beforeEach {
                    request = EditPerson.Request(identifier: nil, name: newName, dogPreference: preference)
                    interactor.updatePersonData(request)
                }
                it("adds new person to database") {
                    expect(database.all().count) == 3
                    let updatedPerson = database[2]
                    expect(updatedPerson.name) == newName
                    expect(updatedPerson.dogPreference).to(beCloseTo(preference))
                }
            }
        }
    }
}
