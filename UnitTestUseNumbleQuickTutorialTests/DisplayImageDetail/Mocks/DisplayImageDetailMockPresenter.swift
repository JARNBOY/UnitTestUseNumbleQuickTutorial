//
//  DisplayImageDetailMockPresenter.swift
//  UnitTestUseNumbleQuickTutorialTests
//
//  Created by Papon Supamongkonchai on 3/11/2565 BE.
//

import Foundation
@testable import UnitTestUseNumbleQuickTutorial

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
