//
//  ChaosFanShapeViewController.swift
//  ChaosComponent
//
//  Created by jh on 2022/1/10.
//

import UIKit
//使用泛型 where 分句来扩展到一个协议。 Container的item无需限制Equatable
//extension Container where Item: Equatable {
//    func startsWith(_ item: Item) -> Bool {
//        return count >= 1 && self[0] == item
//    }
//}

//扩展现有类型来指定关联类型
//extension Array: Container {}

//上下文 Where 分句
//当你已经在范型类型上下文中时，你可以把范型  where 分句作为声明的一部分，它自己没有范型类型约束。比如说，你可以在范型类型的下标脚本或者范型类型扩展的方法中写范型 where 分句。 Container 结构体是范型，下边例子中的 where 分句写明了容器中新方法需要满足什么要求才能可用。
//extension Container {
//    func average() -> Double where Item == Int {
//        var sum = 0.0
//        for index in 0..<count {
//            sum += Double(self[index])
//        }
//        return sum / Double(count)
//    }
//    func endsWith(_ item: Item) -> Bool where Item: Equatable {
//        return count >= 1 && self[count-1] == item
//    }
//}


class ChaosFanShapeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        ChaosFanShape5.test()
   
    }
}
