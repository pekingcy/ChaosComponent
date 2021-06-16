//
//  RBTree.hpp
//  ChaosComponent
//
//  Created by jh on 2021/6/11.
//

#ifndef RBTree_hpp
#define RBTree_hpp

#include <stdio.h>
#include "BBSTree.hpp"
#include "RBNode.hpp"

const bool RED = false;
const bool BLACK = true;

template<typename T>
class RBTree :public BBSTree<T> {
    void afterAdd(BTNode<T>* node){
    }
private:
    BTNode<T> color(BTNode<T>* node, bool color) {
        if (node == nullptr) return node;
        ((RBNode<T>*)node)->color = color;
        return node;
    }
    
    BTNode<T> red(BTNode<T>* node) {
        return color(node, RED);
    }
    
    BTNode<T> black(BTNode<T>* node) {
        return color(node, BLACK);
    }
};

#endif /* RBTree_hpp */
