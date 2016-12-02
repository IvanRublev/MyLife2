//
//  ListPeopleViewControllerTests.swift
//  MyLife2
//
//  Created by Ivan Rublev on 12/3/16.
//  Copyright (c) 2016 Ivan Rublev. All rights reserved.
//

@testable import MyLife2
import Quick
import Nimble

class ListPeopleViewControllerTests: QuickSpec {
    // MARK: Mock
    class OutputMock: ListPeopleInteractorInput {
        var receivedRequest: ListPeople.Request?
        
        func showPeopleList(_ request: ListPeople.Request) {
            receivedRequest = request
        }
    }
    
    // MARK: Cases
    override func spec() {
        let bundle = Bundle.main
        let storyboard = UIStoryboard(name: "Main", bundle: bundle)

        var viewController: ListPeopleViewController!
        var output: OutputMock!
        beforeEach {
            viewController = storyboard.instantiateViewController(withIdentifier: "ListPeopleViewController") as! ListPeopleViewController
            output = OutputMock()
            
            viewController.output = output
        }
        describe("The view load") {
            var window: UIWindow!
            
            beforeEach {
                window = UIWindow()
                window.addSubview(viewController.view)
                viewController.beginAppearanceTransition(true, animated: false) // Triggers .viewWillAppear() and .viewDidAppear() events.
                viewController.endAppearanceTransition()
            }
            afterEach {
                viewController.view.removeFromSuperview()
            }
            it("makes output to show people list.") {
                expect(output.receivedRequest).toNot(beNil())
            }
        }
        describe("Asked to display something") {
            var viewModel: ListPeople.Response.ViewModel!
            
            beforeEach {
                viewModel = ListPeople.Response.ViewModel(itemsViewModel:
                    [ListPeople.Response.ViewModel.ItemViewModel(identifier: 0, preparedName: "Name1", preparedImage: nil),
                     ListPeople.Response.ViewModel.ItemViewModel(identifier: 1, preparedName: "Name2", preparedImage: nil)])
                
                viewController.displayList(viewModel)
            }
            it("makes view to display data.") {
                expect(viewController.itemsViewModel!.count) == viewModel.itemsViewModel.count
            }
        }
    }
}
