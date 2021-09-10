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
    var ShopAppId:String?
    var StoreId:String?
    var StoreAppId:String?
    var StoreName:String?
    var StoreAddress:String?
    var Longitude:Double?
    var Latitude:Double?
    var StoreLogo:String?
    var StoreSecTypeId:String?
    var EquipmentState:Int?
    required init?(map: Map) {
    }
    func mapping(map: Map) {
        AppId <- map["AppId"]
        ShopAppId <- map["ShopAppId"]
        StoreId <- map["StoreId"]
        StoreAppId <- map["StoreAppId"]
        StoreName <- map["StoreName"]
        StoreAddress <- map["StoreAddress"]
        Longitude <- map["Longitude"]
        Latitude <- map["Latitude"]
        StoreLogo <- map["StoreLogo"]
        StoreSecTypeId <- map["StoreSecTypeId"]
        EquipmentState <- map["EquipmentState"]
   }
}
