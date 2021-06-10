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
#include "AVLNode.cpp"
#include "BBSTree.hpp"
template<typename T>
class AVLBinaryTree :public BBSTree<T> {
public:
    AVLBinaryTree<T>():BBSTree<T>(){}
    void afterAdd(BTNode<T>* node){
        while ((node = node->_parent) != nullptr) {
            if (isBalanced(node)){
                // 更新高度
                updateHeight(node);
            }else{
                
            }
        }
    }
    
    void afterRemove(BTNode<T>* node){
        while ((node = node.parent) != NULL) {
            if (isBalanced(node)) {
                // 更新高度
                updateHeight(node);
            } else {
                // 恢复平衡
                rebalance(node);
            }
        }
    }
    
    void afterRotate(BTNode<T> grand, BTNode<T> parent, BTNode<T> child) {
        this->afterRotate(grand,parent,child);
        // 更新高度
        updateHeight(grand);
        updateHeight(parent);
    }
    
    bool isBalanced(BTNode<T>* node){
        return abs(((AVLNode<T>*)node)->balanceFactor()) <= 1;
    }
    
    void updateHeight(BTNode<T>* node){
        ((AVLNode<T>*)node)->updateHeight();
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
    
    AVLNode<T>* createNode(T element, AVLNode<T>* parent) {
        return new AVLNode<T>(element, parent);
    }
};

#endif /* AVLBinaryTree_hpp */
