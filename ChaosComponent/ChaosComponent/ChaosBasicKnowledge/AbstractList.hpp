//
//  AbstractList.hpp
//  ChaosComponent
//
//  Created by jh on 2021/3/22.
//

#ifndef AbstractList_hpp
#define AbstractList_hpp
#include <list>
#include <stdio.h>
#import "List.hpp"
#include <iostream>
using namespace std;

template <typename T>
class AbstractList:List<T>{
public:
    int size;
public:
    int listSize(){
        return size;
    }
    bool isEmpty() {
        return size == 0;
    }

    bool contains(T element) {
        return this->indexOf(element) != ELEMENT_NOT_FOUND;
    }
    
    void add(int index, T element){
        
    }
    
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
