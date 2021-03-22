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
    T data; /*数据成员可以是多个不同类型的数据*/
    Node *next;/*指针变量成员只能是-个*/
public:
    Node(T element,Node<T> next){
        this->data = element;
        this->next = next;
    }
};
template<class T>
class linkedList:AbstractList<T>{
private:
    int size;
    Node<T> *first;
public:
    void clear();
    T get(int index);
    T set(int index,T element);
private:
    Node<T> node(int index);
};
#endif /* AList_hpp */
