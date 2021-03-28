//
//  232_用栈实现队列.cpp
//  ChaosComponent
//
//  Created by 柴志勇 on 2021/3/28.
//

#include <stdio.h>
#include <stack>
using namespace std;
class MyQueue {
private:
    stack<int> * inStack;
    stack<int> * outStack;
public:
    /** Initialize your data structure here. */
    MyQueue() {
        inStack = new stack<int>;
        outStack = new stack<int>;
    }
    
    ~MyQueue(){
        delete inStack; inStack = nullptr;
        delete outStack;outStack = nullptr;
    }
    
    /** Push element x to the back of queue. */
    void push(int x) {
        inStack->push(x);
    }
    
    /** Removes the element from in front of queue and returns that element. */
    int pop() {
        checkOutStack();
        int temp = outStack->top();
        outStack->pop();
        return temp;
    }
    
    
    /** Get the front element. */
    int peek() {
        checkOutStack();
        return outStack->top();
    }
    
    /** Returns whether the queue is empty. */
    bool empty() {
        return inStack->empty()&& outStack->empty();
    }
    
    void checkOutStack(){
        if (outStack->empty()) {
            while (!inStack->empty()) {
                outStack->push(inStack->top());
                inStack->pop();
            }
        }
    }
};
