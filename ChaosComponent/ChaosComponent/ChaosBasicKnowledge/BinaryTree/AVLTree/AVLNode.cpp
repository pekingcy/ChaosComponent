//
//  AVLNode.cpp
//  ChaosComponent
//
//  Created by jh on 2021/4/15.
//

#include "AVLNode.hpp"


template<typename T> int AVLNode<T>:: balanceFactor() {
    int leftHeight = this->_left == nullptr ? 0 : ((AVLNode<T>*)this->_left)->height;
    int rightHeight = this->_right == nullptr ? 0 : ((AVLNode<T>*)this->_right)->height;
    return leftHeight - rightHeight;
}

template<typename T> void AVLNode<T>:: updateHeight() {
    int leftHeight = this->_left == nullptr ? 0 : ((AVLNode<T>*)this->_left)->height;
    int rightHeight = this->_right == nullptr ? 0 : ((AVLNode<T>*)this->_right)->height;
    height = 1 +  fmax(leftHeight, rightHeight);
}

template<typename T> BTNode<T>* AVLNode<T>:: tallerChild() {
    int leftHeight = this->_left == nullptr ? 0 : ((AVLNode<T>*)this->_left)->height;
    int rightHeight = this->_right == nullptr ? 0 : ((AVLNode<T>*)this->_right)->height;
    if (leftHeight > rightHeight) return this->_left;
    if (leftHeight < rightHeight) return this->_right;
    return this->isLeftChild() ? this->_left : this->_right;
}
