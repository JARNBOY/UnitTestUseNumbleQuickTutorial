//
//  DisplayImageDetailInteractor.swift
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

protocol DisplayImageDetailBusinessLogic
{
  func doSomething(request: DisplayImageDetail.Something.Request)
}

protocol DisplayImageDetailDataStore
{
  //var name: String { get set }
}

class DisplayImageDetailInteractor: DisplayImageDetailBusinessLogic, DisplayImageDetailDataStore
{
  var presenter: DisplayImageDetailPresentationLogic?
  var worker: DisplayImageDetailWorker?
  //var name: String = ""
  
  // MARK: Do something
  
  func doSomething(request: DisplayImageDetail.Something.Request)
  {
    worker = DisplayImageDetailWorker()
    worker?.doSomeWork()
    
    let response = DisplayImageDetail.Something.Response()
    presenter?.presentSomething(response: response)
  }
}
