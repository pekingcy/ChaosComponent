//
//  ChaosNetworkResult.swift
//  ChaosComponent
//
//  Created by jh on 2021/9/10.
//

import Foundation
import ObjectMapper
protocol ChaosNetworkResultType {
    associatedtype T: Mappable
    /// 数据
    var data: T? { get set }
    /// 是否请求成功的标记
    var success: Bool { get }
    /// 请求结果说明
    var message: String? { get }
    /// 通过json数据初始化
    init(json: [String: Any])
    /// 通过错误信息初始化
    init(errorMsg: String?)
}

extension ChaosNetworkResultType {
    /// 数据解析
    mutating func parseData(obj: Any?) {
        /// 如果dataObj是T，直接赋值
        if let dataObj = obj as? T {
            data = dataObj
            return
        }
        guard let model = try? Mapper<T>().map(JSONObject:obj) else { return }
        data = model
    }
}

struct ChaosNetworkResult<Model: Mappable>: ChaosNetworkResultType {
 
    typealias T = Model
    var data: Model?
    var success: Bool
    var message: String?
    
    init(json: [String: Any]) {
        success = json["IsSuccess"] as? Bool ?? false
        message = json["Message"] as? String
        parseData(obj: json)
    }
    
    init(errorMsg: String?) {
        success = false
        message = errorMsg
    }
}
