//
//  storeLiveList.swift
//  ChaosComponent
//
//  Created by jh on 2021/9/8.
//

import Foundation
import ObjectMapper

class StoreLiveModel:Mappable{
    var storeList:[StoreLiveItem]?
    required init?(map: Map) {
    }
    func mapping(map: Map) {
        storeList <- map["storeList"]
    }
}

class StoreLiveItem:Mappable {
    var Id:String?
    var appId:String?
    var storeId:String?
    var storeName:String?
    var storeType:String?
    var storePicUrl:String?
    var level:String?
    var faceStr:String?
    var levelStr:String?
    var praiseNum:String?
    var watchNum:String?
    var restaurantType:String?
    var area:String?
    var isHasEquipment:Bool?
    var shopAppId:String?
    var liveType:String?
    var liveId:String?
    var equipmentStatus:String?
    var address:String?
    var labelid:String?
    var labelname:String?
    var storescore:String?
    var businessstatusvalue:String?
    var newlabelname:String?
    var isSelected:Bool?
 
    required init?(map: Map) {
    }
    func mapping(map: Map) {
        Id <- map["Id"]
        appId <- map["appId"]
        storeId <- map["storeId"]
        storeName <- map["storeName"]
        storeType <- map["storeType"]
        storePicUrl <- map["storePicUrl"]
        level <- map["level"]
        faceStr <- map["faceStr"]
        levelStr <- map["levelStr"]
        praiseNum <- map["praiseNum"]
        watchNum <- map["watchNum"]
        restaurantType <- map["restaurantType"]
        area <- map["area"]
        isHasEquipment <- map["isHasEquipment"]
        shopAppId <- map["shopAppId"]
        liveType <- map["liveType"]
        liveId <- map["liveId"]
        liveType <- map["liveType"]
        equipmentStatus <- map["equipmentStatus"]
        address <- map["address"]
        labelid <- map["labelid"]
        labelname <- map["labelname"]
        storescore <- map["storescore"]
        businessstatusvalue <- map["businessstatusvalue"]
        newlabelname <- map["newlabelname"]
        isSelected <- map["isSelected"]
   }
}
