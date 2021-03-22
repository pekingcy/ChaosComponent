//
//  List.hpp
//  ChaosComponent
//
//  Created by jh on 2021/3/22.
//

#ifndef List_hpp
#define List_hpp

#include <stdio.h>

static int ELEMENT_NOT_FOUND = -1;

template <class T>
class List{
public:
    /**
    *清除所有元素
    */
   virtual void clear();

   /**
    * 元素的数量
    * @return
    */
    virtual int listSize();

   /**
    * 是否为空
    * @return
    */
    virtual bool isEmpty();

   /**
    * 是否包含某个元素
    * @param element
    * @return bool
    */
    virtual bool contains(T element);

   /**
    * 添加元素到尾部
    * @param element
    */
    virtual void add(T element);

   /**
    * 获取index位置的元素
    * @param index
    * @return
    */
    virtual T get(int index);

   /**
    * 设置index位置的元素
    * @param index
    * @param element
    * @return 原来的元素ֵ
    */
    virtual T set(int index, T element);

   /**
    * 在index位置插入一个元素
    * @param index
    * @param element
    */
    virtual void add(int index, T element);

   /**
    * 删除index位置的元素
    * @param index
    * @return
    */
    virtual T remove(int index);
   /**
    * 查看元素的索引
    * @param element
    * @return
    */
    virtual int indexOf(T element);

};
#endif /* List_hpp */
