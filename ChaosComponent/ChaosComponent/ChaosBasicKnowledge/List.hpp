//
//  List.hpp
//  ChaosComponent
//
//  Created by jh on 2021/3/22.
//

#ifndef List_hpp
#define List_hpp

#include <stdio.h>

using namespace std;

static int ELEMENT_NOT_FOUND = -1;

template <typename T>
class List{
public:
    virtual void clear() = 0;

    virtual int listSize() = 0;

    virtual bool isEmpty() = 0;

    virtual bool contains(T element) = 0;

    virtual void add(T element) = 0;

    virtual void add(int index, T element) = 0;

    virtual T get(int index) = 0;

    virtual T set(int index, T element) = 0;

    virtual T remove(int index) = 0;

    virtual int indexOf(T element) = 0;

};
#endif /* List_hpp */
