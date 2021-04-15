//
//  BTNode.cpp
//  ChaosComponent
//
//  Created by jh on 2021/4/15.
//

#include "BTNode.hpp"

template<typename T> BTNode<T>::BTNode(){}
 
template<typename T> BTNode<T>::BTNode(T element, BTNode<T>* parent){
   this->element = element;
   this->_parent = parent;
}
 
template<typename T> bool BTNode<T>::isLeaf(){
    return _left == nullptr && _right == nullptr;
}

template<typename T> bool BTNode<T>::hasTwoChildren(){
    return _left != nullptr && _right != nullptr;
}

template<typename T> bool BTNode<T>::isLeftChild() {
    return _parent != nullptr && this == _parent->_left;
}

template<typename T> bool BTNode<T>::isRightChild() {
     return _parent != nullptr && this == _parent->_right;
}
