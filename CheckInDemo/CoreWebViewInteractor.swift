//
//  CoreWebViewInteractor.swift
//  CheckInDemo
//
//  Created by GZOffice_hao on 2020/2/27.
//  Copyright © 2020 Gtomato. All rights reserved.
//

import Foundation
import WebKit

struct JSMessage {
    let name: String?
    let method: String?
    let parameters: [String: String]?
    
    init(with dic: [String: Any]) {
        name = dic[CoreWebViewInteractor.Keys.name.rawValue] as? String
        method = dic[CoreWebViewInteractor.Keys.method.rawValue] as? String
        parameters = dic[CoreWebViewInteractor.Keys.parameters.rawValue] as? [String: String]
    }
}

protocol JSMethodInterface {
    func sayHello(_ parameters: [String: String]?)
}

class CoreWebViewInteractor: NSObject {
    static let NameOfMessageHandler = "CheckInNative"
    enum Keys: String {
        case name = "nameOfMessageHandler"
        case method = "nativeMethod"
        case parameters = "parameters"
    }
}

// JS 注入
extension CoreWebViewInteractor: WKScriptMessageHandler {
    
    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        if let body = message.body as? [String: Any] {
            let bodyObject = JSMessage(with: body)
            if CoreWebViewInteractor.NameOfMessageHandler == bodyObject.name, let method = bodyObject.method {
                var methodName = method
                if bodyObject.parameters != nil {
                    methodName += ":"
                }
                let selector = Selector(methodName)
                if responds(to: selector) {
                    perform(selector, with: bodyObject.parameters)
                }
            }
        }
    }
    
}

// Native fucntion
extension CoreWebViewInteractor: JSMethodInterface {
    @objc
    func sayHello(_ parameters: [String: String]?) {
        print("execute say hello function")
        print(parameters?["message"])
    }
}
