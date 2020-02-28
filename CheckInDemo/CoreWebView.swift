//
//  CoreWebView.swift
//  CheckInDemo
//
//  Created by GZOffice_hao on 2020/2/27.
//  Copyright © 2020 Gtomato. All rights reserved.
//

import UIKit
import WebKit

class CoreWebView: WKWebView {
    
    lazy var webViewInteractor = CoreWebViewInteractor()
    
    init() {
        super.init(frame: .zero, configuration: WKWebViewConfiguration())
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    private func setup() {
        // 设置交互
        configuration.userContentController.add(webViewInteractor, name: CoreWebViewInteractor.NameOfMessageHandler)
    }
    
    // 需要监听加载
    
    // 添加header
    
    // 调用 JS 方法
    func callJSFunction(with scriptString: String) {
        evaluateJavaScript(scriptString) { (item, error) in
            if let error = error {
                print("error > \(error)")
            } else {
                print("success")
            }
        }
    }

}
