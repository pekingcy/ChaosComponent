//
//  ChaosFanShapeViewController.swift
//  ChaosComponent
//
//  Created by jh on 2022/1/10.
//

import UIKit

// 2、泛型类型
    struct Stack<Element> {
        var items = [Element]()
        mutating func push(_ item: Element) {
            items.append(item)
        }
        mutating func pop() -> Element {
            return items.removeLast()
        }
    }
    
    extension Stack {
        var topItem: Element? {
            return items.isEmpty ? nil : items[items.count - 1]
        }
    }

class ChaosFanShapeViewController: UIViewController {

// 1、泛型函数
    func swapTwoValues<T>(_ a: inout T, _ b: inout T) {
        let temporaryA = a
        a = b
        b = temporaryA
    }
 
//    func someFunction<T: SomeClass, U: SomeProtocol>(someT: T, someU: U) {
//         
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //泛型函数
        var a = 100
        var b = 200
        swapTwoValues(&a, &b)
        print(String(a) + "-" + String(b))
        //泛型类型
        var stackOfStrings = Stack<String>()
        stackOfStrings.push("uno")
        stackOfStrings.push("dos")
        stackOfStrings.push("tres")
        stackOfStrings.push("cuatro")
        if let topItem = stackOfStrings.topItem {
            print("The top item on the stack is \(topItem).")
        }
    }
}
