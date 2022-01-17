//
//  ChaosFanShape1.swift
//  ChaosComponent
//
//  Created by jh on 2022/1/12.
//

import UIKit

class ChaosFanShape1: NSObject {
    // 1、泛型函数
    func swapTwoValues<T>(_ a: inout T, _ b: inout T) {
        let temporaryA = a
        a = b
        b = temporaryA
    }
    
    //类型约束
    func findIndex<T: Equatable>(of valueToFind: T, in array:[T]) -> Int? {
        for (index, value) in array.enumerated() {
            if value == valueToFind {
                return index
            }
        }
        return nil
    }
    
    func test(){
        //泛型函数
        var a = 100
        var b = 200
        swapTwoValues(&a, &b)
        print("泛型函数:" + String(a) + "-" + String(b))
        
        //类型约束
        let doubleIndex = findIndex(of: 0.1, in: [3.14159, 0.1, 0.25])
        let stringIndex = findIndex(of: "Andrea", in: ["Mike", "Malcolm", "Andrea"])
    }
}
