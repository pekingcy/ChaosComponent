//
//  ChaosStoreApi.swift
//  ChaosComponent
//
//  Created by jh on 2021/9/10.
//

import Foundation
import Moya

enum SimpleApi {
    case GetFssStoreList
    case GetBookExhibitByAppId
}

extension SimpleApi: TargetType {
    
    func chaosEnvironment() -> String{
        let plistPath = Bundle.main.path(forResource: "ip", ofType: "plst")
        if plistPath != nil {
             return ""
        }
        return ""
    }
    
    var baseURL: URL {
        let url = "https://" + chaosEnvironment() + "iustore.iuoooo.com"
        return URL(string: url)!
    }
    
    var headers: [String : String]? {
        return ["Content-type": "application/json; charset=utf-8"]
    }
    
    var method: Moya.Method {
        return .post
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var path: String {
        switch self {
          case .GetFssStoreList:
              return "/Jinher.AMP.Store.SV.StoreQuerySV.svc/GetFssStoreList"
          case .GetBookExhibitByAppId:
              return "/Jinher.AMP.Store.SV.ReleaseSV.svc/GetBookExhibitByAppId"
        }
    }
    var task: Task {
        var parmeters: [String : Any] = [:]
        switch self {
        case .GetFssStoreList:
            let filter: [String : Any] =  ["storescore":"","businessstatusvalue":"","marketCode":"","labelIds":[],"operateType":"","filterAreaCode":"","newlableid":"","govGrade":"","restaurantType":"","distance":"","tradeAreaCode":"","areaCode":""]
            parmeters = ["storeListSearchDTO":["userId":"1290ca39-f598-4861-a7b6-9b0516022a07","pageSize":20,"pageIndex":1,"lat":40.05397244454516,"lng":116.29715203940199,"areaCode":"2-110100","appId":"9be42759-9686-4541-b5a4-2be15a5c7d73","storescorecode":"1","searchContent":"","filter":filter, "clientInfo":["version":"v1.8.0","versionNum":"180","device":"ios"]] as [String : Any]]
            return .requestParameters(parameters: parmeters, encoding: JSONEncoding.default)
        case .GetBookExhibitByAppId:
            parmeters = [ "appId":"9be42759-9686-4541-b5a4-2be15a5c7d73","type":1]
            return .requestParameters(parameters: parmeters, encoding: JSONEncoding.default)
      }
        
    }
}
