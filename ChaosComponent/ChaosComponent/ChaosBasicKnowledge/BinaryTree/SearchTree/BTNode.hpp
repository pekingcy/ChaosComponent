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
    BTNode();
    BTNode(T element, BTNode<T>* parent);
    
//    BTNode(){}
//    BTNode(T element, BTNode<T>* parent){
//       this->element = element;
//       this->_parent = parent;
//    }
    bool isLeaf();
    bool hasTwoChildren();
    bool isLeftChild();
    bool isRightChild();
};

#endif /* BTNode_hpp */
