//
//  AVLBinaryTree.hpp
//  ChaosComponent
//
//  Created by jh on 2021/4/15.
//

#ifndef AVLBinaryTree_hpp
#define AVLBinaryTree_hpp

#include <stdio.h>
#include "BinarySearchTree.hpp"
#include "math.h"

template<typename T>
class AVLNode:public BTNode<T> {
        int height = 1;
public:
       AVLNode(T element, BTNode<T>* parent):BTNode<T>(element,parent){}
       int balanceFactor() {
           int leftHeight = this->_left == nullptr ? 0 : ((AVLNode<T>)this->_left)->height;
           int rightHeight = this->_right == nullptr ? 0 : ((AVLNode<T>)this->_right)->height;
           return leftHeight - rightHeight;
       }

       void updateHeight() {
           int leftHeight = this->_left == nullptr ? 0 : ((AVLNode<T>)this->_left)->height;
           int rightHeight = this->_right == nullptr ? 0 : ((AVLNode<T>)this->_right)->height;
           height = 1 +  max(leftHeight, rightHeight);
       }

       Node<T>* tallerChild() {
           int leftHeight = this->_left == nullptr ? 0 : ((AVLNode<T>)this->_left)->height;
           int rightHeight = this->_right == nullptr ? 0 : ((AVLNode<T>)this->_right)->height;
           if (leftHeight > rightHeight) return this->_left;
           if (leftHeight < rightHeight) return this->_right;
           return this->isLeftChild() ? this->_left : this->_right;
       }
};

template<typename T>
class AVLBinaryTree {
public:
    AVLBinaryTree(){}
    
    
    
    void afterAdd(BTNode<T>* node){
        while ((node = node->_parent) != nullptr) {
            if (isBalanced()){
                 
            }
        }
    }
    
    bool isBalanced(BTNode<T>* node){
        return abs((AVLNode<T>)node.balanceFactor() <= 1);
    }
    
};

#endif /* AVLBinaryTree_hpp */
