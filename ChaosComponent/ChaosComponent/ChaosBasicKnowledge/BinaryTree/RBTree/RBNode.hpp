//
//  RTNode.hpp
//  ChaosComponent
//
//  Created by jh on 2021/6/11.
//

#ifndef RBNode_hpp
#define RBNode_hpp

#include <stdio.h>
#include "math.h"
#include "BTNode.hpp"
#include "RBTree.hpp"
template<typename T>
class RBNode:public BTNode<T> {
        bool color = RED;
public:
    RBNode(T element, BTNode<T>* parent):BTNode<T>(element,parent){
       
    };
  
    string toString() {
        string str = "";
        if (color == RED) {
            str = "R_";
        }
        return str + std::to_string(this->element);
    }
};
#endif /* RTNode_hpp */
