//
//  Deque.hpp
//  ChaosComponent
//
//  Created by jh on 2021/3/29.
//

#ifndef Deque_hpp
#define Deque_hpp

#include <stdio.h>
#include "LinkedList.cpp"

using namespace std;
template <typename T>

class Deque{
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
    
    void enQueueRear(T element){
        list->add(element);
    }
    
    T deQueueFront() {
        return list->remove(0);
    }
    void enQueueFront(T element) {
        list.add(0, element);
    }

    T deQueueRear() {
        return list.remove(list.size() - 1);
    }

    T front() {
        return list.get(0);
    }
    
    T rear() {
        return list.get(list.size() - 1);
    }
};

#endif /* Deque_hpp */
