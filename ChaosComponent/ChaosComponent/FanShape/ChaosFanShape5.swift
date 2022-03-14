//
//  ChaosFanShape1.swift
//  ChaosComponent
//
//  Created by jh on 2022/1/12.
//

import UIKit
 //3关联类型的应用--添加约束

struct Stack5<Element:Equatable>: Container5 {
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
protocol Container5{
    associatedtype Item:Equatable  //1、关联类型,没有定义 Item 是什么类型，这个信息留给遵循协议的类型去提供。2、Equatable
    mutating func append(_ item: Item)
    var count: Int { get }
    subscript(i: Int) -> Item { get }
}
//--- 在关联类型约束里使用协议
protocol SuffixableContainer5: Container5 {
    associatedtype Suffix: SuffixableContainer5 where Suffix.Item == Item
    func suffix(_ size: Int) -> Suffix
}

extension Stack5: SuffixableContainer5 {
    func suffix(_ size: Int) -> Stack5 {
        var result = Stack5()
        for index in (count-size)..<count {
            result.append(self[index])
        }
        return result
    }
}
//------泛型

////--非泛型类型
struct IntStack5:Container5{
    // original IntStack implementation
       var items = [Int]()
       mutating func push(_ item: Int) {
           items.append(item)
       }
       mutating func pop() -> Int {
           return items.removeLast()
       }
       // conformance to the Container protocol
       typealias ItemType = Int   //注：Swift的类型推断功能，你不用真的在 IntStack 定义中声明一个具体的 Int 类型 ItemType
       mutating func append(_ item: Int) {
           self.push(item)
       }
       var count: Int {
           return items.count
       }
       subscript(i: Int) -> Int {
           return items[i]
       }
}

extension IntStack5: SuffixableContainer5 {
    func suffix(_ size: Int) -> Stack5<Int>  {
        var result = Stack5<Int>()
        for index in (count-size)..<count {
            result.append(self[index])
        }
        return result
    }
}

class ChaosFanShape5: NSObject {
   class func test(){
        var stackOfInts = IntStack5()
        stackOfInts.append(10)
        stackOfInts.append(20)
        stackOfInts.append(30)
        let suffix = stackOfInts.suffix(2)
    }
}
