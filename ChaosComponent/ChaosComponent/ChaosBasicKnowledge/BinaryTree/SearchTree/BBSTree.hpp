//
//  BBSTree.hpp
//  ChaosComponent
//
//  Created by jh on 2021/6/10.
//

#ifndef BBSTree_hpp
#define BBSTree_hpp

#include <stdio.h>
#include "BinarySearchTree.hpp"
template <typename T>
class BBSTree:public BinarySearchTree<T>{
public:
    BBSTree<T>(): BinarySearchTree<T>(){
    }
    void rotateLeft(BTNode<T> grand){
        BTNode<T> parent = grand->_right;
        BTNode<T> child = parent->_left;
        grand->_right = child;
        parent->_left = grand;
        afterRotate(grand, parent, child);
    }
    
    void rotateRight(BTNode<T> grand){
        BTNode<T> parent = grand->_left;
        BTNode<T> child = parent->_right;
        grand->_left = child;
        parent->_right = grand;
        afterRotate(grand, parent, child);
    }
    
    void afterRotate(BTNode<T> grand, BTNode<T> parent, BTNode<T> child) {
        // 让parent称为子树的根节点
        parent->_parent = grand->_parent;
        if (grand->isLeftChild()) {
            grand->_parent->_left = parent;
        } else if (grand->isRightChild()) {
            grand->_parent->_right = parent;
        } else { // grand是root节点
          // _root = parent;
        }
        
        // 更新child的parent
        if (child != nullptr) {
            child->_parent = grand;
        }
        // 更新grand的parent
        grand->_parent = parent;
        // 更新高度
        updateHeight(grand);
        updateHeight(parent);
    }
};

#endif /* BBSTree_hpp */
