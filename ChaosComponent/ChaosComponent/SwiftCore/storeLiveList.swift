//
//  storeLiveList.swift
//  ChaosComponent
//
//  Created by jh on 2021/9/8.
//

import Foundation
import ObjectMapper

class StoreLiveModel:Mappable{
    var Data:[StoreLiveItem]?
    required init?(map: Map) {
    }
    func mapping(map: Map) {
        Data <- map["Data"]
    }
}

class StoreLiveItem:Mappable {
    var AppId:String?
    var StoreId:String?
    var StoreAppId:String?
    var StoreName:String?
    var StoreAddress:String?
    var StoreLogo:String?
    var StoreSecTypeId:String?
    var EquipmentState:String?
    required init?(map: Map) {
    }
    func mapping(map: Map) {
        AppId <- map["AppId"]
        StoreId <- map["StoreId"]
        StoreAppId <- map["StoreAppId"]
        StoreName <- map["StoreName"]
        StoreAddress <- map["StoreAddress"]
        StoreLogo <- map["StoreLogo"]
        StoreSecTypeId <- map["StoreSecTypeId"]
        EquipmentState <- map["EquipmentState"]
   }
}
