//
//  ListPeoplePresenterTests.swift
//  MyLife2
//
//  Created by Ivan Rublev on 12/3/16.
//  Copyright (c) 2016 Ivan Rublev. All rights reserved.
//

@testable import MyLife2
import Quick
import Nimble

class ListPeoplePresenterTests: QuickSpec {
    // MARK: Mock
    class OutputMock: ListPeoplePresenterOutput {
        var receivedViewModel: ListPeople.Response.ViewModel?
        
        func displayList(_ viewModel: ListPeople.Response.ViewModel) {
            receivedViewModel = viewModel
        }
    }

    override func spec() {
        var presenter: ListPeoplePresenter!
        var output: OutputMock!
        
        beforeEach {
            presenter = ListPeoplePresenter()
            output = OutputMock()
            
            presenter.output = output
        }
        describe("Asked to present people list") {
            var response: ListPeople.Response!
            
            beforeEach {
                response = ListPeople.Response(items: [ListPeople.Response.Item(identifier: 0, name: "Name1", image: nil),
                                                       ListPeople.Response.Item(identifier: 1, name: "Name2", image: nil)])
                presenter.presentList(response)
            }
            it("makes view controller to display people list with uppercase names.") {
                let items = output.receivedViewModel!.itemsViewModel
                expect(items.count) == 2
                expect(items[0].preparedName) == response.items[0].name!.uppercased()
            }
        }
    }
}
