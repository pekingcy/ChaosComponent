//
//  ChaosFanShape1.swift
//  ChaosComponent
//
//  Created by jh on 2022/1/12.
//

import UIKit
 //2、泛型类型
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

class ChaosFanShape2: NSObject {
    func test(){
        var stackOfStrings = Stack<String>()
        stackOfStrings.push("uno")
        stackOfStrings.push("dos")
        stackOfStrings.push("tres")
        stackOfStrings.push("cuatro")
        if let topItem = stackOfStrings.topItem {
            print("The top item on the stack is \(topItem).")
        }

        let fromTheTop = stackOfStrings.pop()
        print("The top item on the stack is \(fromTheTop).")

        if let topItem = stackOfStrings.topItem {
            print("The top item on the stack is \(topItem).")
        }
    }
}
