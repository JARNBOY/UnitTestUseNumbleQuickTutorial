//
//  DisplayImageDetailMockViewController.swift
//  UnitTestUseNumbleQuickTutorialTests
//
//  Created by Papon Supamongkonchai on 3/11/2565 BE.
//

import Foundation

@testable import UnitTestUseNumbleQuickTutorial

class DisplayImageDetailMockViewController: DisplayImageDetailView {
    
    var isPresentShowDisplayImage: Bool = false
    var isPresentShowStartLoadingView: Bool = false
    var isPresentShowStopLoadingView: Bool = false
    var isPresentShowError: Bool = false
    
    // MARK: DisplayImageDetailView
    func displayDisplayImage(viewModel: DisplayImageDetailModels.DetailModels.ViewModel) {
        isPresentShowDisplayImage = true
    }
    
    func displayStartLoading() {
        isPresentShowStartLoadingView = true
    }
    
    func displayStopLoading() {
        isPresentShowStopLoadingView = true
    }
    
    func displayError() {
        isPresentShowError = true
    }
    
}
