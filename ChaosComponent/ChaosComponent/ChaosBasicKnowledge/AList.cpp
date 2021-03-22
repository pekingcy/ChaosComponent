//
//  AList.cpp
//  ChaosComponent
//
//  Created by jh on 2021/3/22.
//

#include "AList.hpp"
#include <iostream>

using namespace std;

template<typename T> void linkedList<T>:: clear(){
    this->size = 0;
    first = NULL;
}

template<typename T> T linkedList<T>:: get(int index){
    if (index < this->size) {
        
    }
}

template<typename T> Node<T> linkedList<T>:: node(int index){
    
    int i = 0;
    Node<T> pointN = first;
    while (i <= index) {
        pointN = pointN.next;
        i++;
    }
    return  pointN.next;
}
