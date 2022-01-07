//
//  ChaosNetworkManager.swift
//  ChaosComponent
//
//  Created by jh on 2021/9/10.
//
import Foundation
import Moya
import ObjectMapper
// MARK: - 网络控制器，使用非常简单
struct ChaosNetworkManager<Model: Mappable> {
    /// 返回的数据结果封装，如果ChaosNetworkResult不符合你的要求，你可以自定义Result，只需要遵守ChaosNetworkResultType协议就行了
    /// 你可以将 ChaosNetworkResult<Model> 替换为 YourNetworkResult<Model>
    typealias ChaosRespneseResult = ChaosNetworkResult<Model>
    /// 请求完成的回调
    typealias ChaosNetworkCompletionClosure = (_ result: ChaosRespneseResult) -> ()
    /// progress的回调
    typealias ChaosNetworkProgressClosure = (_ progress: CGFloat) -> ()

    /// 请求数据 范型
    ///
    /// - Parameters:
    ///   - target: TargetType
    ///   - progress: progress回调
    ///   - completion: 完成的回调
    func request<T: TargetType>(target: T, progress: ChaosNetworkProgressClosure? = nil, completion: @escaping ChaosNetworkCompletionClosure) {
        /// 设置请求超时时间
        let requestClosure = { (endpoint: Endpoint, done: @escaping MoyaProvider<T>.RequestResultClosure) in
            guard var request = try? endpoint.urlRequest() else { return }
            // 设置请求超时时间30s
            request.timeoutInterval = 30
            done(.success(request))
        }
        let provider = MoyaProvider<T>(requestClosure: requestClosure)
        /// 开始请求数据
        provider.request(target, callbackQueue: DispatchQueue.main, progress: { (progressResponse) in
            progress?(CGFloat(progressResponse.progress))
        }) { (result) in
            switch result {
            case let .success(moyaResponse):
                do {
                    guard let json = try moyaResponse.mapJSON() as? [String: Any] else {
                        /// 不是json数据
                        completion(ChaosRespneseResult(errorMsg: "服务器返回的不是json数据"))
                        return
                    }
                    /// 成功
                    completion(ChaosRespneseResult(json: json))
                } catch {
                    /// 解析出错
                    completion(ChaosRespneseResult(errorMsg: error.localizedDescription))
                }
            case let .failure(error):
                /// 请求出错
                completion(ChaosRespneseResult(errorMsg: error.errorDescription))
            }
        }
    }
}
