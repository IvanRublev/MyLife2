//
//  ListPeopleInteractorTests.swift
//  MyLife2
//
//  Created by Ivan Rublev on 12/3/16.
//  Copyright (c) 2016 Ivan Rublev. All rights reserved.
//

@testable import MyLife2
import Quick
import Nimble

class ListPeopleInteractorTests: QuickSpec {
    // MARK: Mock
    class OutputMock: ListPeopleInteractorOutput {
        var receivedResponse: ListPeople.Response?
        
        func presentList(_ response: ListPeople.Response) {
            receivedResponse = response
        }
    }
    
    override func spec() {
        var interactor: ListPeopleInteractor!
        var output: OutputMock!
        var database: PersonDatabase!
        
        beforeEach {
            interactor = ListPeopleInteractor()
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
        describe("Asked to show list") {
            var request: ListPeople.Request!
            beforeEach {
                request = ListPeople.Request()
                interactor.showPeopleList(request)
            }
            it("makes output to present list of persons from database.") {
                let responseItems = output.receivedResponse!.items
                expect(responseItems.count) == 2
            }
        }
    }
}
