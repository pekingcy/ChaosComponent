//
//  BinaryTree.hpp
//  ChaosComponent
//
//  Created by jh on 2021/4/8.
//



#ifndef BinarySearchTree_hpp
#define BinarySearchTree_hpp

#include <stdio.h>
#include "BTNode.cpp"
#include "BinaryTree.hpp"

template <typename T>
class BinarySearchTree:public BinaryTree<T>{

public:
    BinarySearchTree<T>(): BinaryTree<T>(){
        
    }
    //添加节点
    void add(T element){
        elementNotNullCheck(element);
        if (this->_root == nullptr) {
            this->_root = this->createNode(element,nullptr);
            this->_size ++;
        }else{
            BTNode<T>* parent = this->root();
            BTNode<T>* node  =  this->root();
            int cmp = 0;
            do{
                parent = node;
                cmp = compare(element,node->element);
                if (cmp > 0) {
                    node = node->_right;
                }else if(cmp < 0){
                    node = node->_left;
                }else{
                    node->element = element;
                };
                 
            }while (node != nullptr);
            
            BTNode<T>* newNode = new BTNode<T>(element,parent);
            if (cmp > 0) {
                parent->_right = newNode;
            }else{
                parent->_left = newNode;
            }
            this->_size ++;
            // 新添加节点之后的处理
            this->afterAdd(newNode);
        }
     
    }
    /**
     * 添加node之后的调整
     * @param node 新添加的节点
     */
   virtual void afterAdd(BTNode<T>* node) { }
    /**
     * 删除node之后的调整
     * @param node 被删除的节点 或者 用以取代被删除节点的子节点（当被删除节点的度为1）
     */
    virtual void afterRemove(BTNode<T>* node) { }
    
    void remove(T element){
        remove(node(element));
    }

    void remove(BTNode<T>* node){
        if (node == nullptr) return;
        this->_size --;
        if (node->hasTwoChildren()) {// 度为2的节点
            // 找到后继节点
            BTNode<T> s = successor(node);
            // 用后继节点的值覆盖度为2的节点的值
            node->element = s->element;
            // 删除后继节点
            node = s;
        }
        //删除node节点（node的度必然是1或者0）
        BTNode<T>*replaceNode = node->_left != nullptr?node->_left:node->_right;
        if (replaceNode != nullptr ) { //node是度为1的节点
            replaceNode->parent = node->parent;
            if (node->parent == nullptr) {
                this->_root = replaceNode;
            }else if(node == node->parent->_left){
                node->parent->left = replaceNode;
            }else if(node == node->parent->_right){
                node->parent->_right = replaceNode;
            }
            // 删除节点之后的处理
            afterRemove(replaceNode);
        }else if(node->parent == nullptr){// node是叶子节点并且是根节点
            this->_root = nullptr;
            // 删除节点之后的处理
            afterRemove(node);
        }else{
            if (node == node->parent->_left) {
                node->parent->_left = nullptr;
            }else{
                node->parent->_right = nullptr;
            }
            // 删除节点之后的处理
            afterRemove(node);
        }
    }
    void elementNotNullCheck(T element) {
         if (element == NULL) {
             throw ("element must not be null");
        }
    }
    
    int compare(T e1, T e2) {
        return e1 - e2;
    }
    
    BTNode<T>* node(T element) {
        BTNode<T>* node = this->root();
        while (node != nullptr) {
            int cmp = compare(element, node->element);
            if (cmp == 0) return node;
            if (cmp > 0) {
                node = node->right;
            } else { // cmp < 0
                node = node->left;
            }
        }
        return nullptr;
    } 
};

#endif /* BinaryTree_hpp */
