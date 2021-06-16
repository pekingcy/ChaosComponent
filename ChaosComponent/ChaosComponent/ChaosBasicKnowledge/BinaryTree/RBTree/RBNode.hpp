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
extern const bool RED;
extern const bool BLACK;
template<typename T>
class RBNode:public BTNode<T> {
public:
    bool color = RED;
    RBNode(T element, BTNode<T>* parent):BTNode<T>(element,parent){
       
    };
  
//    string toString() {
//        string str = "";
//        if (color == RED) {
//            str = "R_";
//        }
//        return str + std::to_string(this->element);
//    }
};
#endif /* RTNode_hpp */
