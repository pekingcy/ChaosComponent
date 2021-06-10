//
//  BinaryTree.hpp
//  ChaosComponent
//
//  Created by jh on 2021/4/20.
//

#ifndef BinaryTree_hpp
#define BinaryTree_hpp

#include <stdio.h>
#include "BinaryTreeInfo.cpp"
#include "Queue.hpp"

template<typename T>
class  BinaryTree:BinaryTreeInfo<T> {
protected:
    int _size;
    BTNode<T>* _root;
    BinaryTree(){
        _root = nullptr;
    };
public:
    BTNode<T>* root(){
        return _root;
    }
    int size(){
        return _size;
    }
    
    bool isEmpty(){
        return _size == 0;
    }

    void clear(){}
    
    bool contains(T element) {
        return node(element) != nullptr;
    }
    
    bool isCompleteBinaryTree(){
        if (_root == nullptr) return false;
        Queue<BTNode<T>>* queue = new Queue<BTNode<T>>();
        queue->enQueue(_root);
        bool leaf = false;
        while (!queue.isEmpty()) {
            BTNode<T>* node = queue->deQueue();
            if (leaf && !node->isLeaf()) return false;
            if (node->_left != nullptr) {
                queue.enQueue(node->_left);
            } else if (node->_right != nullptr) {
                return false;
            }
            if (node->right != nullptr) {
                queue->enQueue(node->_right);
            } else {
                leaf = true;
            }
        }
        return true;
    }
    
    //查找前驱节点
    BTNode<T>* predecessor(BTNode<T>* node){
        if (node == nullptr) return nullptr;
        BTNode<T>* p = node->_left;
        if (p != nullptr) {
            while (p->_right != nullptr) {
                p = p->_right;
            }
            return p;
        }
        
        while (node->parent != nullptr && node == node->parent->_left) {
            node = node->parent;
        }
        return node->parent;
    }
    //查找后续节点
    BTNode<T>* successor(BTNode<T>* node){
        if (node == nullptr) return nullptr;
        BTNode<T>* p = node->_right;
        if (p != nullptr) {
            while (p->_left != nullptr) {
                p = p->_left;
            }
            return p;
        }
        
        while (node->parent != nullptr && node == node->parent->_right) {
            node = node->parent;
        }
        return node->parent;
    }
    
    public:
    BTNode<T>* createNode(T element, BTNode<T>* parent) {
        return new BTNode<T>(element,parent);
    }
};


#endif /* BinaryTree_hpp */
