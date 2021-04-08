//
//  BinaryTreeInfo.cpp
//  ChaosComponent
//
//  Created by jh on 2021/4/8.
//

#include <stdio.h>

class BinaryTreeInfo{
    virtual void* root() = 0;
    virtual void* left(void* node) = 0;
    virtual void* right(void* node) = 0;
    
};
