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
}

extension SimpleApi: TargetType {
    var baseURL: URL {
        return URL(string: "https://imv.iuoooo.com")!
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
            return "/api/Store/GetStoreLiveList"
        }
    }
    var task: Task {
        var parmeters: [String : Any] = [:]
        switch self {
        case .GetFssStoreList:
            parmeters =  ["userId":"7e771d4f-b90f-4d31-870b-03c2348f3de1","pageSize":20,"PageIndex":1,"LocationLat":40.05397244454516,"LocationLon":116.29715203940199,"OrgId":"7035c461-c80e-49ce-a7c8-5584f0453646","AppId":"9be42759-9686-4541-b5a4-2be15a5c7d73","clientInfo":["version":"v1.8.0","versionNum":"180","device":"ios"]] as [String : Any]
            return .requestParameters(parameters: parmeters, encoding: JSONEncoding.default)
        }
    }
}
