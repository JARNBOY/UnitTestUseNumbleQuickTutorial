//
//  String.swift
//  UnitTestUseNumbleQuickTutorial
//
//  Created by Papon Supamongkonchai on 3/11/2565 BE.
//

import Foundation

extension String {
    var utf8Encoded: Data {
        if let data = data(using: .utf8) {
            return data
        }
        return Data()
    }
}
