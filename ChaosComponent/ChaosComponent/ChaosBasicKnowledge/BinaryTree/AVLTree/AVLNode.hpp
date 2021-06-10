//
//  AVLNode.hpp
//  ChaosComponent
//
//  Created by jh on 2021/4/15.
//

#ifndef AVLNode_hpp
#define AVLNode_hpp

#include "math.h"
#include <stdio.h>
#include "BTNode.hpp"

template<typename T>
class AVLNode:public BTNode<T> {
        int height = 1;
public:
    AVLNode(T element, BTNode<T>* parent):BTNode<T>(element,parent){
        height = 1;
    };
    int balanceFactor();
    void updateHeight();
    BTNode<T>* tallerChild();
};

#endif /* AVLNode_hpp */
