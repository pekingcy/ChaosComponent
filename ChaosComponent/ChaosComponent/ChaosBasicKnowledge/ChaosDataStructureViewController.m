//
//  ChaosDataStructureViewController.m
//  ChaosComponent
//
//  Created by 柴志勇 on 2021/3/28.
//

#import "ChaosDataStructureViewController.h"
#include "LinkedList.cpp"
#include "Stack.cpp"
#include <map>
#include <stack>
#include "CircleQueue.hpp"
@interface ChaosDataStructureViewController ()

@end

@implementation ChaosDataStructureViewController

@synthesize naviTitle = _naviTitle;
- (void)viewDidLoad {
    [super viewDidLoad];
//    LinkedList<int> *list = new LinkedList<int>;
//    list->add(10);
//    list->add(11);
//    list->add(13);
//    list->add(15);
//    list->add(17);
//    list->add(19);
//    cout << list->toString()<<endl;
//    list->remove(0);
//    cout << list->toString()<<endl;
//    list->remove(3);
//    cout << list->toString()<<endl;
//    
//    list->clear();
//    delete list;list = nullptr;
//    
//    Stack<int>* chasStack = new Stack<int>;
//    chasStack->push(12);
//    chasStack->push(11);
//    chasStack->push(10);
//    while (!chasStack->isEmpty()) {
//        cout << chasStack->pop() << endl;
//    }
//    delete chasStack;chasStack = nullptr;
    test2();
}

static void test2() {
    CircleQueue<int> *queue = new CircleQueue<int>();
    // 0 1 2 3 4 5 6 7 8 9
    for (int i = 0; i < 10; i++) {
        queue->enQueue(i);
    }
    // null null null null null 5 6 7 8 9
    for (int i = 0; i < 5; i++) {
        queue->deQueue();
    }
//    // 15 16 17 18 19 5 6 7 8 9
    for (int i = 15; i < 20; i++) {
        queue->enQueue(i);
    }
//    while (!queue->isEmpty()) {
//        cout << queue->deQueue() <<endl;
//    }
    cout << queue->toString() <<endl;
}

@end
