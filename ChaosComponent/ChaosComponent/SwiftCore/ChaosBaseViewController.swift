//
//  ChaosBaseViewController.swift
//  ChaosComponent
//
//  Created by jh on 2021/8/2.
//

import UIKit

class ChaosBaseViewController: UIViewController {

    enum Rank: Int {
        case ace = 1
        case two, three, four, five, six, seven, eight, nine, ten
        case jack, queen, king
        func simpleDescription() -> String {
            switch self {
            case .ace:
                return "ace"
            case .jack:
                return "jack"
            case .queen:
                return "queen"
            case .king:
                return "king"
            default:
                return String(self.rawValue)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let convertedRank = Rank(rawValue: 3) {
            let threeDescription = convertedRank.simpleDescription()
            print(threeDescription)  // [3,4,5,6]
        }
       
      
    }
    
}
