//
//  URLRequest+Extension.swift
//  UnitTestUseNumbleQuickTutorial
//
//  Created by Papon Supamongkonchai on 3/11/2565 BE.
//

import Foundation
import RxCocoa
import RxSwift
import SwiftyJSON

struct Resource<T:Decodable>{
    let url:URL
    let headers: [String: String]
}

extension URLRequest{
    
    static func load<T>(resource: Resource<T>) -> Observable<T?>{
        return Observable.from([resource.url])
            .flatMap { url -> Observable<Data> in
                var request = URLRequest(url: url)
                request.allHTTPHeaderFields = resource.headers
                return URLSession.shared.rx.data(request: request)
            }.map { data -> T? in
                return try? JSONDecoder().decode(T.self, from: data)
            }.asObservable()
    }
    
    static func loadJSON(url:URL,headers: [String: String]) -> Observable<JSON?>{
        return Observable.from([url])
            .flatMap { url -> Observable<Data> in
                var request = URLRequest(url: url)
                request.allHTTPHeaderFields = headers
                return URLSession.shared.rx.data(request: request)
            }.map { data -> JSON? in
                return JSON(data)
            }.asObservable()
    }
    
}


