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
    last = NULL;
}

template<typename T> T linkedList<T>:: get(int index){
    return node(index).element;
}

template<typename T>T linkedList<T>:: set(int index, T element){
    Node<T> node = node(index);
    T old = node.element;
    node.element = element;
    return old;
}

template<typename T>void linkedList<T>:: add(int index, T element){
    this->rangeCheckForAdd(index);
    if(index == this->size){
        Node<T> oldLast = last;
        last = new Node<T>(oldLast,element,NULL);
        if (oldLast == NULL) { // 这是链表添加的第一个元素
            first = last;
        } else {
            oldLast.next = last;
        }
    }else{
        Node<T> next = node(index);
        Node<T> prev = next.prev;
        Node<T> node = new Node<T>(prev, element, next);
        next.prev = node;
        if (prev == NULL) { // index == 0
            first = node;
        } else {
            prev.next = node;
        }
    }
    this->size++;
}

template<typename T>T linkedList<T>:: remove(int index){
    
    this->rangeCheck(index);
    Node<T> node = node(index);
    Node<T> prev = node.prev;
    Node<T> next = node.next;
    
    if (prev == NULL) {
        first = node.next;
    }else{
        prev.next = next;
    }
    if (next == NULL) {
        last = prev;
    }else{
        next.prev = prev;
    }
    this->size --;
    return node.element;
}

template<typename T> Node<T> linkedList<T>:: node(int index){
    this->rangeCheck(index);
    if (index < (this->size >> 1)) {
        Node<T> node = this->first;
        for (int i = 0; i < index; i++) {
            node = node.next;
        }
        return node;
    }else{
        Node<T> node = this->last;
        for (int i = this->size -1; i > index; i--) {
            node = node.next;
        }
        return node;
    }
    return NULL;
}

template<typename T> int linkedList<T>::indexOf(T element) {
    if (element == NULL) {
        Node<T> node = first;
        for (int i = 0; i < this->size; i++) {
            if (node.element == NULL) return i;
            node = node.next;
        }
    } else {
        Node<T> node = first;
        for (int i = 0; i < this->size; i++) {
            if (element == node.element) return i;
            node = node.next;
        }
    }
    return ELEMENT_NOT_FOUND;
}

template<typename T> Node<T>linkedList<T>:: listNode(int index) {
   this.rangeCheck(index);
   if (index < (this->size >> 1)) {
       Node<T> node = first;
       for (int i = 0; i < index; i++) {
           node = node.next;
       }
       return node;
   } else {
       Node<T> node = last;
       for (int i = this->size - 1; i > index; i--) {
           node = node.prev;
       }
       return node;
   }
}

template<typename T> string linkedList<T>:: toString() {
        string str1 = "";
        str1.append("size=").append(this->size).append(", [");
        Node<T> node = first;
        for (int i = 0; i < this->size; i++) {
            if (i != 0) {
                str1.append(", ");
            }
            str1.append(node);
            node = node.next;
        }
        str1.append("]");
        return str1;
    }
