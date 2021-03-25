//
//  141_环型链表.cpp
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
    bool hasCycle(ListNode *head) {
        if(head == nullptr || head->next == nullptr){
                   return false;
               }
               ListNode* slow = head;
               ListNode* fast = head->next;
               while (fast != nullptr && fast->next != nullptr) {
                   slow = slow->next;
                   fast = fast->next->next;
                   if (slow == fast) {
                        return true;
                   }
               }
               
               return false;
    }
};
