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

template <typename T>
class Node{
public:
    T element; /*数据成员可以是多个不同类型的数据*/
    Node<T> *next;/*指针变量成员只能是-个*/
public:
    Node(T element,Node<T> next){
        this->element = element;
        this->next = next;
    }
};
template<class T>
class SingleLinkedList:public AbstractList<T>{
private:
    Node<T> *first;
public:
    void clear();
    T get(int index);
    T set(int index,T element);
    void add(T element);
    void add(int index, T element);
    T remove(int index);
    int indexOf(T element);
    string toString();
private:
    Node<T> node(int index);
};
#endif /* AList_hpp */
