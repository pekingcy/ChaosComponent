//
//  AbstractList.hpp
//  ChaosComponent
//
//  Created by jh on 2021/3/22.
//

#ifndef AbstractList_hpp
#define AbstractList_hpp

#include <stdio.h>
#import "List.hpp"

template <class T>
class AbstractList:List<T>{
protected:
    int size;
public:
    
    int listSize(){
        return size;
    }
    /**
     * 是否为空
     * @return
    */
    bool isEmpty() {
        return size == 0;
    }
    
    /**
     * 是否包含某个元素
     * @param element
     * @return
     */
     bool contains(T element) {
        return indexOf(element) != ELEMENT_NOT_FOUND;
    }
};


#endif /* AbstractList_hpp */
