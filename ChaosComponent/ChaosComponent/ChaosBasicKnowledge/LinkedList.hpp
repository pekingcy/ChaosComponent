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
    Node<T> *prev;
    Node<T> *next;/*指针变量成员只能是-个*/
public:
    Node(Node<T>* prev,T element,Node<T>* next){
        this->prev = prev;
        this->element = element;
        this->next = next;
    }
    string toString() {
        string nodeStr = "";
        if (prev != NULL) {
            nodeStr.append(to_string(prev->element));
        } else {
            nodeStr.append("null");
        }
        nodeStr.append("_");
        nodeStr.append(to_string(element));
        nodeStr.append("_");
        if (next != NULL) {
            nodeStr.append(to_string(next->element));
        } else {
            nodeStr.append("null");
        }
        return nodeStr;
    }
};

template<typename T>
class LinkedList:public AbstractList<T>{
private:
    Node<T> *first;
    Node<T> *last;
    
public:
    LinkedList(){
        this->size = 0;
        this->first = nullptr;
        this->last = nullptr;
    };
    void clear();
    T get(int index);
    T set(int index,T element);
    void add(T element);
    void add(int index, T element);
    T remove(int index);
    int indexOf(T element);
    string toString();
private:
    Node<T>* node(int index);
    Node<T>* listNode(int index);
};
#endif /* AList_hpp */
