//
//  AList.cpp
//  ChaosComponent
//
//  Created by jh on 2021/3/22.
//

#include "CircleLinkedList.hpp"
#include <iostream>
using namespace std;

template<typename T> void CircleLinkedList<T>:: clear(){
    this->size = 0;
    while (this->first != NULL) {
        Node<T>* deleteNextNode =  this->first->next;
        delete this->first;
        this->first = deleteNextNode;
    }
    this->first = NULL;
    this->last = NULL;
}

template<typename T> T CircleLinkedList<T>:: get(int index){
    return node(index)->element;
}

template<typename T>T CircleLinkedList<T>:: set(int index, T element){
    Node<T> *node = this->node(index);
    T old = node->element;
    node->element = element;
    return old;
}

template<typename T> void CircleLinkedList<T>:: add(T element) {
     this->add(this->size,element);
}

template<typename T>void CircleLinkedList<T>:: add(int index, T element){
    this->rangeCheckForAdd(index);
    if(index == this->size){
        Node<T> * oldLast = last;
        last = new Node<T>(oldLast,element,NULL);
        if (oldLast == NULL) { // 这是链表添加的第一个元素
            first = last;
        } else {
            oldLast->next = last;
        }
    }else{
        Node<T> *next = node(index);
        Node<T> *prev = next->prev;
        Node<T> *node = new Node<T>(prev, element, next);
        next->prev = node;
        if (prev == NULL) { // index == 0
            first = node;
        } else {
            prev->next = node;
        }
    }
    this->size++;
}

template<typename T>T CircleLinkedList<T>:: remove(int index){
    
    this->rangeCheck(index);
    Node<T>* node = this->node(index);
    Node<T>* prev = node->prev;
    Node<T>* next = node->next;
    
    if (prev == NULL) {
        first = node->next;
    }else{
        prev->next = next;
    }
    if (next == NULL) {
        last = prev;
    }else{
        next->prev = prev;
    }
    this->size --;
    T temp = node->element;
    delete node;
    return temp;
}

template<typename T> Node<T>* CircleLinkedList<T>:: node(int index){
    this->rangeCheck(index);
    if (index < (this->size >> 1)) {
        Node<T> *node = this->first;
        for (int i = 0; i < index; i++) {
            node = node->next;
        }
        return node;
    }else{
        Node<T>* node = this->last;
        for (int i = this->size -1; i > index; i--) {
            node = node->prev;
        }
        return node;
    }
    return NULL;
}

template<typename T> int CircleLinkedList<T>::indexOf(T element) {
    if (element == NULL) {
        Node<T>* node = first;
        for (int i = 0; i < this->size; i++) {
            if (node->element == NULL) return i;
            node = node->next;
        }
    } else {
        Node<T>* node = first;
        for (int i = 0; i < this->size; i++) {
            if (element == node->element) return i;
            node = node->next;
        }
    }
    return ELEMENT_NOT_FOUND;
}

template<typename T> Node<T>* CircleLinkedList<T>:: listNode(int index) {
   this.rangeCheck(index);
   if (index < (this->size >> 1)) {
       Node<T>* node = first;
       for (int i = 0; i < index; i++) {
           node = node->next;
       }
       return node;
   } else {
       Node<T>* node = last;
       for (int i = this->size - 1; i > index; i--) {
           node = node->prev;
       }
       return node;
   }
}

template<typename T> string CircleLinkedList<T>:: toString() {
        string str1 = "";
        str1 = str1.append("size=");
        str1 = str1.append(to_string(this->size));
        str1 = str1.append(", [");
        Node<T>* node = first;
        for (int i = 0; i < this->size; i++) {
            if (i != 0) {
                str1.append(", ");
            }
            str1.append(node->toString());
            node = node->next;
        }
        str1.append("]");
        return str1;
    }
