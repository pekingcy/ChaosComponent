//
//  ChaosBaseViewController.swift
//  ChaosComponent
//
//  Created by jh on 2021/8/2.
//

import UIKit
import SwiftyJSON
import ObjectMapper

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
    
    func parseModel() -> Void {
        let storeLiveList:[[String:Any]] = [["AppId": "123","StoreId": "123","StoreAppId": "123","StoreName": "123","StoreAddress": "123","StoreLogo": "123","StoreSecTypeId": "123","EquipmentState": "123"],["AppId": "123","StoreId": "123","StoreAppId": "123","StoreName": "123","StoreAddress": "123","StoreLogo": "123","StoreSecTypeId": "123","EquipmentState": "123"]];
        let jsonData = JSON.init(storeLiveList)
//        let storeLive = Mapper<storeLiveItem>().mapArray(JSONString: jsonData.rawString()!)
//        if ((storeLive?.isEmpty) != nil) {
//           // let item1 = storeLive?.first
//            let item1:storeLiveItem? = storeLive?[0]
//            print(item1?.AppId as Any)
////            for vaule: storeLiveItem in storeLive {
////                print(vaule)
////            }
//        }else{
//
//        }
//        print(storeLive)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        parseModel()
//        if let convertedRank = Rank(rawValue: 3) {
//            let threeDescription = convertedRank.simpleDescription()
//            print(threeDescription)  // [3,4,5,6]
//        }
        ChaosNetworkManager<StoreLiveModel>().request(target: SimpleApi.GetFssStoreList) { (result) in
            guard let data = result.data  else {
                /// error
                print(result.message ?? "")
                return
            }
            /// success
            print(data)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
    }
    
    
}
