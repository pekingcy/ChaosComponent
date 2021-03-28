//
//  MArray.cpp
//  ChaosComponent
//
//  Created by jh on 2021/3/17.
//

#include "MArray.hpp"
#include <mm_malloc.h>
#include <iostream>

using namespace std;

template<typename T> bool MArray<T>::ensureCapcity(){
    if(length >= size){
        T *newBase = (T*)realloc(base,10 * sizeof(T) + size * sizeof(T));
        if(!newBase){
            return false;
        }
        base = newBase;
        size += 10;
        newBase = nullptr;
    }
    return true;
}

template<typename T> bool MArray<T>::add(T item){
    if(!ensureCapcity()){
        return false;
    }
    T *p = base + length;
    *p = item;
    length ++;
    return true;
}

template<typename T> bool MArray<T>::insert(int index,const T item){
    if(!ensureCapcity()){
        return false;
    }
    if(index < 1 || index > length){
        return false;
    }
    T *q = base + index - 1;
    T *p = base + length - 1;
    while( p >= q){
        *(p+1) = *p;
        p--;
    }
    *q = item;
    q = nullptr;
    p = nullptr;
    length ++;
    return true;
}


template<typename T> bool MArray<T>::set(int index,const T item){
    if(!ensureCapcity()){
        return false;
    }
    if(index < 1 || index > length){
        return false;
    }
    T *p = base + index -1;
    *p = item;
    return true;
}
  
template<typename T>T MArray<T>::del(int index){
    if(index<1 || index > length){
        return NULL;
    }
    T *q = base + index - 1;
    T item = *q;
    ++q;
    T *p = base + length;
    while(q <= p){
        *(q-1)=*q;
        ++q;
    }
    length --;
    return item;
}

template<typename T>T MArray<T>::objectAt(int index){
    if(index<1 || index > length){
        return NULL;
    }
    T *q = base;
    return *(q + index - 1);
}

template <typename T>void MArray<T>::display(){
    T *q = base;
    T *p = base +length - 1;
    while (q<=p) {
        cout << *(q++)<<" ";
    }
    cout << endl;
}

template <typename T>bool MArray<T>:: clear(){
    length = 0;
    return true;
}

template <typename T>bool MArray<T>:: isEmpty(){
    if (length == 0) {
        return true;
    }else{
        return false;
    }
}

