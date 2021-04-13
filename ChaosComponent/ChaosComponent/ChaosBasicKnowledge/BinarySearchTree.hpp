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

template<typename T>
class Node{
    T element;
    Node<T> _left;
    Node<T> _right;
    Node<T> parent;
public:
    Node(T element, Node<T> parent) {
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
    Node<T> _root;
    
    int size(){
        return _size;
    }
    
    bool isEmpty(){
        return _size == 0;
    }
    
    void clear(){}
    
    Node<T>* root(){
        return _root;
    }
    //添加节点
    void add(T element){
        elementNotNullCheck(element);
        if (root() == nullptr) {
            _root = new Node<T>(element,nullptr);
            _size ++;
        }else{
            Node<T>* parent = root();
            Node<T>* node  =  root();
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
            
            Node<T> newNode = Node<T>(element,parent);
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

    void remove(Node<T> node){
        if (node == nullptr) {
             
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
    
    Node<T> node(T element) {
        Node<T> node = root();
        while (node != nullptr) {
            int cmp = compare(element, node.element);
            if (cmp == 0) return node;
            if (cmp > 0) {
                node = node.right;
            } else { // cmp < 0
                node = node.left;
            }
        }
        return nullptr;
    }
    
    Node<T>* left(Node<T>* node){
        
    }
    
    Node<T>* right(Node<T>* node){
        
    }
};

#endif /* BinaryTree_hpp */
