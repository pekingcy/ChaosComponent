//
//  CircleQueue.hpp
//  ChaosComponent
//
//  Created by jh on 2021/3/29.
//

#ifndef CircleQueue_hpp
#define CircleQueue_hpp

#include <stdio.h>
#include <string>

using namespace std;
template<typename T >
class CircleQueue{
private:
    int _front;
    int _size;
    T* elements;
    int length = 10;
    int DEFAULT_CAPACITY = 10;
public:
    CircleQueue(){
        elements = new T[DEFAULT_CAPACITY];
    }
    
    int size(){
        return _size;
    }
    
    bool isEmpty(){
        return _size == 0;
    }
    
    void clear(){
        for (int i = 0; i < _size; i++) {
            for (int i = 0; i < _size; i++) {
                     elements[index(i)] = NULL;
             }
            _front = 0;
            _size = 0;
        }
    }
    
    void enQueue(T element) {
        ensureCapacity(_size + 1);
        
        elements[index(_size)] = element;
        _size++;
    }

    T deQueue() {
        T frontElement = elements[_front];
        elements[_front] = NULL;
        _front = index(1);
        _size--;
        return frontElement;
    }

    T front() {
        return elements[_front];
    }
    
    int index(int index){
        index += _front;
        return index - (index >= length?length:0);
    }
    
    void ensureCapacity(int capacity) {
            int oldCapacity = length;
            if (oldCapacity >= capacity) return;
            
            // 新容量为旧容量的1.5倍
            int newCapacity = oldCapacity + (oldCapacity >> 1);
            length = newCapacity;
            T* newElements = new T[newCapacity];
            for (int i = 0; i < _size; i++) {
                newElements[i] = elements[index(i)];
            }
            elements = newElements;
            // 重置front
            _front = 0;
        }
    
    string toString() {
            string tempstr = "";
            tempstr = tempstr.append("capcacity=");
            tempstr = tempstr.append(to_string(length));
            tempstr = tempstr.append(" length=");
            tempstr = tempstr.append(to_string(length));
            tempstr = tempstr.append(" size=");
            tempstr = tempstr.append(to_string(_size));
            tempstr = tempstr.append(" front=");
            tempstr = tempstr.append(to_string(_front));
            tempstr= tempstr.append(", [");
            for (int i = 0; i < length; i++) {
                if (i != 0) {
                    tempstr.append(", ");
                }
                tempstr.append(to_string(elements[i]));
            }
            tempstr.append("]");
            return tempstr;
        }
    
};

#endif /* CircleQueue_hpp */
