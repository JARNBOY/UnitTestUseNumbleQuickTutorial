//
//  DisplayImageDetailModels.swift
//  UnitTestUseNumbleQuickTutorial
//
//  Created by Papon Supamongkonchai on 3/11/2565 BE.
//  Copyright (c) 2565 BE ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit
import SwiftyJSON

enum DisplayImageDetailModels {
    // MARK: Use cases
    
    enum DetailModels {
        struct Request {
            var imageID:String
        }
        
        struct Response {
            var id: String?
            var author: String?
            var width: String?
            var height: String?
            var url: String?
            var downloadUrl: String?
            
            init(json: JSON) {
                self.id = json["id"].stringValue
                self.author = json["author"].stringValue
                self.width = json["width"].stringValue
                self.height = json["height"].stringValue
                self.url = json["url"].stringValue
                self.downloadUrl = json["download_url"].stringValue
            }
        }
        
        struct ViewModel {
            var author: String
            var width: String
            var height: String
            var urlImage: String
        }
        
    }
}
