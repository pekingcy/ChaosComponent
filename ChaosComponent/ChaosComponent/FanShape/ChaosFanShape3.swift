//
//  ChaosFanShape1.swift
//  ChaosComponent
//
//  Created by jh on 2022/1/12.
//

import UIKit
 //3关联类型的应用
protocol Container1 {
    associatedtype ItemType
    mutating func append(_ item: ItemType)
    var count: Int { get }
    subscript(i: Int) -> ItemType { get }
}

////--非泛型类型
struct IntStack1:Container1{
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

//------泛型
struct Stack2<Element>: Container1 {
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

class ChaosFanShape3: NSObject {
    func test(){
          
    }
}
