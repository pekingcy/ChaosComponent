//
//  ChaosFanShape1.swift
//  ChaosComponent
//
//  Created by jh on 2022/1/12.
//

import UIKit
 //3关联类型的应用--添加约束

struct Stack4<Element:Equatable>: Container2 {
    // original Stack<Element> implementation
    var items = [Element]()
    mutating func push(_ item: Element) {
        items.append(item)
    }
    mutating func pop() -> Element {
        return items.removeLast()
    }
    // conformance to the Container protocol
    mutating func append(_ item: Element) {
        self.push(item)
    }
    var count: Int {
        return items.count
    }
    subscript(i: Int) -> Element {
        return items[i]
    }
}

//给关联类型添加约束
protocol Container2{
    associatedtype Item:Equatable  //1、关联类型,没有定义 Item 是什么类型，这个信息留给遵循协议的类型去提供。2、Equatable
    mutating func append(_ item: Item)
    var count: Int { get }
    subscript(i: Int) -> Item { get }
}
//--- 在关联类型约束里使用协议
protocol SuffixableContainer: Container2 {
    associatedtype Suffix: SuffixableContainer where Suffix.Item == Item
    func suffix(_ size: Int) -> Suffix
}

//------泛型
extension Stack4: SuffixableContainer {
    func suffix(_ size: Int) -> Stack4 {
        var result = Stack4()
        for index in (count-size)..<count {
            result.append(self[index])
        }
        return result
    }
    // Inferred that Suffix is Stack.
}

class ChaosFanShape4: NSObject {
   class func test(){
        var stackOfInts = Stack4<Int>()
        stackOfInts.append(10)
        stackOfInts.append(20)
        stackOfInts.append(30)
        let suffix = stackOfInts.suffix(2)
    }
}
