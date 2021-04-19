//
//  Queue.hpp
//  ChaosComponent
//
//  Created by 柴志勇 on 2021/3/28.
//

#ifndef Queue_hpp
#define Queue_hpp

#include <stdio.h>
#include "LinkedList.cpp"

using namespace std;
template <typename T>
class Queue{
private:
    List<T> * list = new LinkedList<T>;
public:
    int size(){
        return list->size();
    }
    
    bool isEmpty(){
        return list->isEmpty();
    }
    
    void clear(){
        list->clear();
    }
    
    void enQueue(T element){
        list->add(element);
    }
    
    T deQueue(){
        return list->remove(0);
    }
    
    T front(){
        return list->get(0);
    }
};

#endif /* Queue_hpp */
