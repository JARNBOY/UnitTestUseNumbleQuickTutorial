//
//  DisplayImageDetailMock.swift
//  UnitTestUseNumbleQuickTutorialTests
//
//  Created by Papon Supamongkonchai on 3/11/2565 BE.
//

import Foundation
@testable import UnitTestUseNumbleQuickTutorial
import SwiftyJSON

class DisplayImageDetailMockObject {
    var picsumPhotosInfoStatusSuccess: Data {
        return """
    {
        "id": "11",
        "author": "Paul Jarvis",
        "width": 2500,
        "height": 1667,
        "url": "https://unsplash.com/photos/Cm7oKel-X2Q",
        "download_url": "https://picsum.photos/id/11/2500/1667"
    }
    """.utf8Encoded
    }
    
    var picsumPhotosInfoStatusFailure: Data {
        return """
    {}
    """.utf8Encoded
    }
    
    func toPicsumPhotosInfoSuccess() -> DisplayImageDetailModels.DetailModels.Response? {
        do {
            return DisplayImageDetailModels.DetailModels.Response(json: try JSON(data: picsumPhotosInfoStatusSuccess))
        } catch {
            return nil
        }
    }
    
    
    func toFailureError() -> String? {
        return "general_error"
    }
}

extension DisplayImageDetailMockObject {
    var mockRequestDisplayImageDetail: DisplayImageDetailModels.DetailModels.Request {
        return DisplayImageDetailModels.DetailModels.Request(imageID: "116")
    }
    var mockGetExtraNameText: String {
        return "This name is mock person from mock picsum"
    }
    
    var mockIdImage: String {
        return "116"
    }
}
