//
//  JHStoreShowTypeM.swift
//  ChaosComponent
//
//  Created by jh on 2021/9/27.
//

import UIKit
import ObjectMapper

class JHStoreShowModel:Mappable{
    var Data:[JHStoreShowTypeModel]?
    required init?(map: Map) {
    }
    func mapping(map: Map) {
        Data <- map["Data"]
    }
}

class JHStoreShowTypeModel: Mappable {
    var ExCode:String?
    var ExText:String?
    var ExValue:String?
    
    required init?(map: Map) {
    }
    func mapping(map: Map) {
        ExCode <- map["ExCode"]
        ExText <- map["ExText"]
        ExValue <- map["ExValue"]
   }
}
