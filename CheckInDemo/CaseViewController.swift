//
//  CaseViewController.swift
//  CheckInDemo
//
//  Created by GZOffice_hao on 2020/2/27.
//  Copyright © 2020 Gtomato. All rights reserved.
//

import UIKit

class CaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        print("case did load")
    }
        
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("case will appear")
    }

}
