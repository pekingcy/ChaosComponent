//
//  BinaryTree.hpp
//  ChaosComponent
//
//  Created by jh on 2021/4/8.
//

#ifndef BinaryTree_hpp
#define BinaryTree_hpp

#include <stdio.h>
#include "BinaryTreeInfo.cpp"
#include "Queue.hpp"

template<typename T>
class BTNode{
    T element;
    BTNode<T> _left;
    BTNode<T> _right;
    BTNode<T>* parent;
public:
    BTNode(T element, BTNode<T>* parent) {
      this.element = element;
      this.parent = parent;
    }
    
    bool isLeaf(){
        return _left == nullptr && _right == nullptr;
    }
    
    bool hasTwoChildren(){
        return _left != nullptr && _right != nullptr;
    }
};

template<typename T>
class BinarySearchTree:BinaryTreeInfo{
    private:
    int _size;
    BTNode<T> _root;
    
    int size(){
        return _size;
    }
    
    bool isEmpty(){
        return _size == 0;
    }
    
    void clear(){}
    
    BTNode<T>* root(){
        return _root;
    }
    //添加节点
    void add(T element){
        elementNotNullCheck(element);
        if (_root == nullptr) {
            _root = new BTNode<T>(element,nullptr);
            _size ++;
        }else{
            BTNode<T>* parent = root();
            BTNode<T>* node  =  root();
            int cmp = 0;
            do{
                parent = node;
                cmp = compare(element,node->element);
                if (cmp > 0) {
                    node = node->right;
                }else if(cmp < 0){
                    node = node->left;
                }else{
                    node->element = element;
                };
                 
            }while (node != nullptr);
            
            BTNode<T> newNode = BTNode<T>(element,parent);
            if (cmp > 0) {
                parent->right = newNode;
            }else{
                parent->left = newNode;
            }
            _size ++;
        }
    }
    
    void remove(T element){
        remove(node(element));
    }

    void remove(BTNode<T>* node){
        if (node == nullptr) return;
        _size --;
        if (node->hasTwoChildren()) {// 度为2的节点
            // 找到后继节点
            Node<T> s = successor(node);
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
                _root = replaceNode;
            }else if(node == node->parent->_left){
                node->parent->left = replaceNode;
            }else if(node == node->parent->_right){
                node->parent->_right = replaceNode;
            }
        }else if(node->parent == nullptr){// node是叶子节点并且是根节点
            _root = nullptr;
        }else{
            if (node == node->parent->_left) {
                node->parent->_left = nullptr;
            }else{
                node->parent->_right = nullptr;
            }
        }
    }
    void elementNotNullCheck(T element) {
         if (element == nullptr) {
             throw ("element must not be null");
        }
    }
    
    int compare(T e1, T e2) {
        return 1;
    }
    
    BTNode<T>* node(T element) {
        BTNode<T>* node = root();
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
    
    BTNode<T>* left(BTNode<T>* node){
        
    }
    
    BTNode<T>* right(BTNode<T>* node){
        
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
        
        if (node->parent != nullptr && node == node->parent->_left) {
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
        
        if (node->parent != nullptr && node == node->parent->_right) {
            node = node->parent;
        }
        return node->parent;
    }
    
};

#endif /* BinaryTree_hpp */
