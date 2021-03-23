//
//  AList.hpp
//  ChaosComponent
//
//  Created by jh on 2021/3/22.
//

#ifndef AList_hpp
#define AList_hpp

#include <stdio.h>
#import "AbstractList.hpp"

template <class T>
class Node{
public:
    T element; /*数据成员可以是多个不同类型的数据*/
    Node<T> *prev;
    Node<T> *next;/*指针变量成员只能是-个*/
public:
    Node(Node<T> prev,T element,Node<T> next){
        this->prev = prev;
        this->data = element;
        this->next = next;
    }
};
template<class T>
class linkedList:public AbstractList<T>{
private:
    Node<T> *first;
    Node<T> *last;
    
public:
    void clear();
    T get(int index);
    T set(int index,T element);
    void add(int index, T element);
    T remove(int index);
private:
    Node<T> node(int index);
public:
    
    int indexOf(T element) {
        if (element == NULL) {
            Node<T> node = first;
            for (int i = 0; i < this->size; i++) {
                if (node.element == NULL) return i;
                
                node = node.next;
            }
        } else {
            Node<T> node = first;
            for (int i = 0; i < this->size; i++) {
                if (element.equals(node.element)) return i;
                node = node.next;
            }
        }
        return ELEMENT_NOT_FOUND;
    }
    
private:
    
Node<T> listNode(int index) {
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
};
#endif /* AList_hpp */
