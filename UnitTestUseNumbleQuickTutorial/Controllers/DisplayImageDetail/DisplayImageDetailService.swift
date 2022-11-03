//
//  DisplayImageDetailService.swift
//  UnitTestUseNumbleQuickTutorial
//
//  Created by Papon Supamongkonchai on 3/11/2565 BE.
//

import Foundation
import SwiftyJSON
import RxCocoa
import RxSwift

class DisplayImageDetailService {
    func requestImageDisplayDetails(imageRandomId: String, aSuccess: @escaping (JSON) -> (), aFailure: @escaping (_ error: String?) -> ()) {
       
        if let url = URL(string: "https://picsum.photos/id/\(imageRandomId)/info") {
            _ = URLRequest.loadJSON(url: url, headers: [:])
                .subscribe(onNext:{ json in
                    if let json = json{
                        aSuccess(json)
                    } else {
                        aFailure("request error")
                    }
            })
        } else {
            aFailure(nil)
        }
    }
}
