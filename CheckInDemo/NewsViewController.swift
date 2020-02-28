//
//  NewsViewController.swift
//  CheckInDemo
//
//  Created by GZOffice_hao on 2020/2/27.
//  Copyright © 2020 Gtomato. All rights reserved.
//

import UIKit
import WebKit

class NewsViewController: UIViewController {
    
    @IBOutlet weak var wkWebView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let url = Bundle.main.url(forResource: "index", withExtension: "html") {
            wkWebView.loadFileURL(url, allowingReadAccessTo: url)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("news will appear")
    }

}
