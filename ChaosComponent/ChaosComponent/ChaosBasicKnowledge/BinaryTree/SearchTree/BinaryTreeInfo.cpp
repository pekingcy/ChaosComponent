//
//  BinaryTreeInfo.cpp
//  ChaosComponent
//
//  Created by jh on 2021/4/8.
//

#include <stdio.h>
#include "BTNode.cpp"
template<typename T>
class BinaryTreeInfo{
    virtual BTNode<T>* root() = 0;
};
