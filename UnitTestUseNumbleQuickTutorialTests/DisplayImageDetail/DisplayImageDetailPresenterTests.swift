//
//  DisplayImageDetailPresenterTests.swift
//  UnitTestUseNumbleQuickTutorialTests
//
//  Created by Papon Supamongkonchai on 3/11/2565 BE.
//

import Foundation
import Quick
import Nimble

@testable import UnitTestUseNumbleQuickTutorial
class DisplayImageDetailPresenterTests: QuickSpec {
    override func spec() {
        describe("DisplayImageDetailPresenterTests") {
            var presenter: DisplayImageDetailPresenter!
            var viewController: DisplayImageDetailMockViewController!
            beforeEach {
                presenter = DisplayImageDetailPresenter()
                viewController = DisplayImageDetailMockViewController()
                presenter.viewController = viewController
            }
            
            // MARK: Presentation logic
            context("presentDisplayImage") {
                it("Working") {
                    let mock = DisplayImageDetailMockObject().toPicsumPhotosInfoSuccess()
                    presenter.presentDisplayImage(response: mock)
                    expect(viewController.isPresentShowDisplayImage) == true
                }
            }
            
            context("presentStartLoading") {
                it("Working") {
                    presenter.presentStartLoading()
                    expect(viewController.isPresentShowStartLoadingView) == true
                }
            }
            
            context("presentStopLoading") {
                it("Working") {
                    presenter.presentStopLoading()
                    expect(viewController.isPresentShowStopLoadingView) == true
                }
            }
            
            context("presentError") {
                it("Working") {
                    presenter.presentError()
                    expect(viewController.isPresentShowError) == true
                }
            }
        }
    }
}
    
