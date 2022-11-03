//
//  DisplayImageDetailMockWorker.swift
//  UnitTestUseNumbleQuickTutorialTests
//
//  Created by Papon Supamongkonchai on 3/11/2565 BE.
//

import Foundation
@testable import UnitTestUseNumbleQuickTutorial

class DisplayImageDetailMockWorker: DisplayImageDetailWorker {
    var isFail:Bool = false
    let mock = DisplayImageDetailMockObject()
    
    override func getLoanCancelReasonList(imageRandomId: String, aCompletion: @escaping (DisplayImageDetailModels.DetailModels.Response?) -> Void, fail: @escaping (String?) -> ()) {
        
        if !isFail {
            aCompletion(mock.toPicsumPhotosInfoSuccess())
        } else {
            fail(mock.toFailureError())
        }
    }
}
