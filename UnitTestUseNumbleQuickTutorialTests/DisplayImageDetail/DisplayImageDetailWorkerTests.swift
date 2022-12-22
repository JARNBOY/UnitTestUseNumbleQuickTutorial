//
//  DisplayImageDetailWorkerTests.swift
//  UnitTestUseNumbleQuickTutorialTests
//
//  Created by Papon Supamongkonchai on 22/12/2565 BE.
//

import Foundation
import Quick
import Nimble
import SwiftyJSON

@testable import UnitTestUseNumbleQuickTutorial
class DisplayImageDetailWorkerTests: QuickSpec {
    override func spec() {
        describe("DisplayImageDetailWorkerTests") {
            var worker: DisplayImageDetailWorker!
            var service: DisplayImageDetailMockService!
            
            beforeEach {
                service = DisplayImageDetailMockService()
                worker = DisplayImageDetailWorker(with:service)
            }
            
            // MARK: Business logic
            context("requestImageDisplayDetails") {
                it("Sucess") {
                    service.isFail = false

                    worker.getImageDisplay(imageRandomId: service.mock.mockIdImage) { _ in
                        service.isResponseStatusSuccess = true
                    } fail: { error in
                        service.isResponseStatusSuccess = false
                    }


                    expect(service.isResponseStatusSuccess) == true

                }
                
                it("Failure") {
                    service.isFail = true
                    
                    worker.getImageDisplay(imageRandomId: service.mock.mockIdImage) { _ in
                        service.isResponseStatusSuccess = true
                    } fail: { error in
                        service.isResponseStatusSuccess = false
                    }
                    
                    expect(service.isResponseStatusSuccess) == false
                }
            }
            
        }
    }
}


class DisplayImageDetailMockService: DisplayImageDetailService {
    var isFail:Bool = false
    var isResponseStatusSuccess = false
    let mock = DisplayImageDetailMockObject()
    
    override func requestImageDisplayDetails(imageRandomId: String, aSuccess: @escaping (JSON) -> (), aFailure: @escaping (String?) -> ()) {
        if !isFail {
            aSuccess(JSON(rawValue: mock.toPicsumPhotosInfoSuccess() as Any) ?? JSON())
        } else {
            aFailure(nil)
        }
    }
    
}
