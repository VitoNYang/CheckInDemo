//
//  CheckInViewController.swift
//  CheckInDemo
//
//  Created by GZOffice_hao on 2020/2/27.
//  Copyright © 2020 Gtomato. All rights reserved.
//

import UIKit

class CheckInViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        print("check in did load")
    }
        
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("check in will appear")
    }

}
