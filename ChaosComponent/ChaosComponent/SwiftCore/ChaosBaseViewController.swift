//
//  ChaosBaseViewController.swift
//  ChaosComponent
//
//  Created by jh on 2021/8/2.
//

import UIKit

class ChaosBaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let label = "The width is "
        let width = 94
        let widthLabel = label + String(width)
        print(widthLabel)
    }
}
