//
//  AbstractList.hpp
//  ChaosComponent
//
//  Created by jh on 2021/3/22.
//

#ifndef AbstractList_hpp
#define AbstractList_hpp

#include <stdio.h>
#import "List.hpp"
#include <iostream>
using namespace std;

template <class T>
class AbstractList:List<T>{
public:
    int size;
public:
    int listSize(){
        return size;
    }
    /**
     * 是否为空
     * @return
    */
    bool isEmpty() {
        return size == 0;
    }
    /**
     * 是否包含某个元素
     * @param element
     * @return
     */
   bool contains(T element) {
        return indexOf(element) != ELEMENT_NOT_FOUND;
    }

    /**
     * 添加元素到尾部
     * @param element
     */
    void add(T element) {
        add(size, element);
    }
public:
     void outOfBounds(int index) {
        cout << "Index:" << index << ", Size:" << size << endl;
    }
    
    void rangeCheck(int index) {
        if (index < 0 || index >= size) {
            outOfBounds(index);
        }
    }
    
    void rangeCheckForAdd(int index) {
        if (index < 0 || index > size) {
            outOfBounds(index);
        }
    }
};



#endif /* AbstractList_hpp */
