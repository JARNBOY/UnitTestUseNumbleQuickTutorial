//
//  DisplayImageDetailInteractorTests.swift
//  UnitTestUseNumbleQuickTutorialTests
//
//  Created by Papon Supamongkonchai on 3/11/2565 BE.
//

import Foundation
import Quick
import Nimble

@testable import UnitTestUseNumbleQuickTutorial
class DisplayImageDetailInteractorTests: QuickSpec {
    override func spec() {
        describe("DisplayImageDetailInteractorTests") {
            var interactor: DisplayImageDetailInteractor!
            var presenter: DisplayImageDetailMockPresenter!
            var worker: DisplayImageDetailMockWorker!
            beforeEach {
                worker = DisplayImageDetailMockWorker(with: DisplayImageDetailService())
                presenter = DisplayImageDetailMockPresenter()
                interactor = DisplayImageDetailInteractor()
                interactor.presenter = presenter
                interactor.worker  = worker
            }
            
            context("requestDisplayImage") {
                it("Success") {
                    worker.isFail = false
                    interactor.requestDisplayImage(request: worker.mock.mockRequestDisplayImageDetail)
                    expect(presenter.isCallProcessShowDisplayImageDetailView) == true
                    expect(presenter.isCallProcessShowStartLoadingView) == true
                    expect(presenter.isCallProcessShowStopLoadingView) == true
                }
                
                it("Failure") {
                    worker.isFail = true
                    interactor.requestDisplayImage(request: worker.mock.mockRequestDisplayImageDetail)
                    expect(presenter.isCallProcessShowStopLoadingView) == true
                    expect(presenter.isCallProcessShowStartLoadingView) == true
                    expect(presenter.isCallProcessShowGeneralErrorView) == true
                }
            }
            
            context("getExtraNameText") {
                it("Success") {
                    let mockExtra = worker.mock.mockGetExtraNameText
                    _ = interactor.getExtraNameText()
                    expect(mockExtra.isEmpty) == false
                }
            }
        }
    }
}

class DisplayImageDetailMockWorker: DisplayImageDetailWorker {
    var isFail:Bool = false
    let mock = DisplayImageDetailMockObject()
    
    override func getImageDisplay(imageRandomId: String, aCompletion: @escaping (DisplayImageDetailModels.DetailModels.Response?) -> Void, fail: @escaping (String?) -> ()) {
        
        if !isFail {
            aCompletion(mock.toPicsumPhotosInfoSuccess())
        } else {
            fail(mock.toFailureError())
        }
    }
}

class DisplayImageDetailMockPresenter: DisplayImageDetailPresenter {
    
    var isCallProcessShowStartLoadingView : Bool = false
    var isCallProcessShowStopLoadingView : Bool = false
    var isCallProcessShowDisplayImageDetailView : Bool = false
    var isCallProcessShowGeneralErrorView : Bool = false
    
    override func presentDisplayImage(response: DisplayImageDetailModels.DetailModels.Response?) {
        isCallProcessShowDisplayImageDetailView = true
    }
    
    override func presentStartLoading() {
        isCallProcessShowStartLoadingView = true
    }
    
    override func presentStopLoading() {
        isCallProcessShowStopLoadingView = true
    }
    
    override func presentError() {
        isCallProcessShowGeneralErrorView = true
    }
}
