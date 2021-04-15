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
#include "AVLNode.hpp"

template<typename T>
class AVLBinaryTree {
public:
    AVLBinaryTree(){}
    void afterAdd(BTNode<T>* node){
        while ((node = node->_parent) != nullptr) {
            if (isBalanced(node)){
                // 更新高度
                updateHeight(node);
            }else{
                
            }
        }
    }
    
    bool isBalanced(BTNode<T>* node){
        return abs((AVLNode<T>)node->balanceFactor() <= 1);
    }
    
    void updateHeight(BTNode<T>* node){
        ((AVLNode<T>)node)->updateHeight();
    }
    
    void reBalanced(BTNode<T>* grand){
        BTNode<T> parent = ((AVLNode<T>)grand)->tallerChild();
        BTNode<T> node = ((AVLNode<T>)parent)->tallerChild();
        if (parent->isLeftChild()){//L
            if (node->isLeftChild()) {//LL 右旋
                rotateRight(grand);
            }else{ //LR
                rotateLeft(parent);
                rotateRight(grand);
            }
        }else{
            if (node->isLeftChild()) { //RL
                rotateRight(parent);
                rotateLeft(grand);
            }else{  //RR 左旋
                rotateLeft(grand);
            }
        }
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

#endif /* AVLBinaryTree_hpp */
