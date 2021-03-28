//
//  Stack.hpp
//  ChaosComponent
//
//  Created by 柴志勇 on 2021/3/28.
//

#ifndef Stack_hpp
#define Stack_hpp

#include <stdio.h>
#include "MArray.cpp"

using namespace std;
template <typename T>
class Stack{
private:
    MArray<T> *array = new MArray<T>;
public:
    void clear(){
        array->clear();
    }
    
    int size(){
        return array->size;
    }
    
    bool isEmpty(){
        return array->isEmpty;
    }
    
    void push(T element){
        array->add(element);
    }
    
    T pop(){
        return array->objectAt(array->size - 1);
    }
    
    T top(){
        return array->get(array->size - 1);
    }
};

#endif /* Stack_hpp */
