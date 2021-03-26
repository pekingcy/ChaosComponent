//
//  AList.cpp
//  ChaosComponent
//
//  Created by jh on 2021/3/22.
//

#include "SingleLinkedList.hpp"
#include <iostream>

using namespace std;

template<typename T> void SingleLinkedList<T>:: clear(){
    this->size = 0;
    while (this->first != NULL) {
        Node<T>* deleteNextNode =  this->first->next;
        delete this->first;
        this->first = deleteNextNode;
    }
    this->first = NULL;
}

template<typename T> T SingleLinkedList<T>:: get(int index){
    return node(index)->element;
}

template<typename T>T SingleLinkedList<T>:: set(int index, T element){
    Node<T>* node = node(index);
    T old = node->element;
    node->element = element;
    return old;
}

template<typename T>void SingleLinkedList<T>::  add(T element){
    this->add(this->size,element);
}

template<typename T>void SingleLinkedList<T>:: add(int index, T element){
    this->rangeCheckForAdd(index);
    if(index == 0){
        Node<T>* newFirst = new Node<T>(element,first);
        Node<T>* last = (this->size == 0)?newFirst:node(this->size - 1);
        last->next = newFirst;
        first = newFirst;
    }else{
        Node<T>* prev = node(index - 1);
        prev->next = new Node<T>(element, prev->next);
    }
    this->size++;
}

template<typename T>T SingleLinkedList<T>:: remove(int index){
    
    this->rangeCheck(index);
    Node<T>* node = first;
    if(index == 0){
        if(this->size == 0){
            first = nullptr;
        }else{
            Node<T>* last = node(this->size-1);
            first = first->next;
            last->next = first;
        }
    }else{
        Node<T>* prev = node(index - 1);
        node = prev->next;
        prev.next = node->next;
    }
    this->size --;
    T temp = node->element;
    delete node;
    return temp;
}

template<typename T> Node<T> SingleLinkedList<T>:: node(int index){
    this->rangeCheck(index);
    Node<T>* node = first;
    for (int i = 0; i < index; i++) {
        node = node->next;
    }
    return node;
}

template<typename T> int SingleLinkedList<T>::indexOf(T element) {
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

template<typename T> string SingleLinkedList<T>:: toString() {
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
