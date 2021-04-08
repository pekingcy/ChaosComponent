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
    Node<T> left;
    Node<T> right;
    Node<T> parent;
public:
    Node(T element, Node<T> parent) {
      this.element = element;
      this.parent = parent;
    }
    
    bool isLeaf(){
        return left == nullptr && right == nullptr;
    }
    
    bool hasTwoChildren(){
        return left != nullptr && right != nullptr;
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
    
    Node* root(){
        reture _root;
    }
  
    Node* left(Node* node){
        
    }
    
    Node* right(Node* node){
        
    }
};

#endif /* BinaryTree_hpp */
