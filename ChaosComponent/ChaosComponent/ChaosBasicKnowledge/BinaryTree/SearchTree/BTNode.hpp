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
    T element;
    BTNode<T> _left;
    BTNode<T> _right;
    BTNode<T>*_parent;
    
    BTNode();
protected:
    BTNode(T element, BTNode<T>* parent);
public:
    bool isLeaf();
    bool hasTwoChildren();
    bool isLeftChild();
    bool isRightChild();
};

#endif /* BTNode_hpp */
