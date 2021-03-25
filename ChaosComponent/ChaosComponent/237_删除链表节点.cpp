//
//  237_删除链表节点.cpp
//  ChaosComponent
//
//  Created by jh on 2021/3/24.
//

#include <stdio.h>

struct ListNode {
    int val;
    ListNode *next;
    ListNode() : val(0), next(nullptr) {}
    ListNode(int x) : val(x), next(nullptr) {}
    ListNode(int x, ListNode *next) : val(x), next(next) {}
};

class Solution {
public:
    void deleteNode(ListNode* node) {
        node.val = node.next.val;
        node.next = node.next.next;
    }
};
