//
//  BTNode.hpp
//  ChaosComponent
//
//  Created by jh on 2021/4/15.
//

#ifndef BTNode_hpp
#define BTNode_hpp

#include <stdio.h>

template<typename T>
class BTNode{
public:
    T element;
    BTNode<T>* _left;
    BTNode<T>* _right;
    BTNode<T>* _parent;
    BTNode(){
        this->element = NULL;
        this->_left = nullptr;
        this->_right = nullptr;
        this->_parent = nullptr;
    }
    BTNode(T element){
        this->element = element;
        this->_left = nullptr;
        this->_right = nullptr;
        this->_parent = nullptr;
    }
    BTNode(T element, BTNode<T>* parent){
       this->element = element;
       this->_left = nullptr;
       this->_right = nullptr;
       this->_parent = parent;
    }
     
    bool isLeaf(){
        return _left == nullptr && _right == nullptr;
    }

    bool  hasTwoChildren(){
        return _left != nullptr && _right != nullptr;
    }

    bool  isLeftChild() {
        return _parent != nullptr && this == _parent->_left;
    }

    bool isRightChild() {
         return _parent != nullptr && this == _parent->_right;
    }
};

#endif /* BTNode_hpp */
