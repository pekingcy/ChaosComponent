//
//  20_有效的括号.cpp
//  ChaosComponent
//
//  Created by 柴志勇 on 2021/3/28.
//

#include <stdio.h>
#include <string>
#include <stack>
#include "Stack.hpp"
#include <map>
using namespace std;


class Solution {
public:
    
   
    bool isValid(string s) {
        while (s.find("()") != string::npos || s.find("[]") != string::npos || s.find("{}") != string::npos) {
        
            if (s.find("()") != string::npos) {
                s = s.replace(s.find("()"),2,"");
            }
            if (s.find("[]") != string::npos) {
                s = s.replace(s.find("[]"),2,"");
            }
            if (s.find("{}") != string::npos) {
                s = s.replace(s.find("{}"),2,"");
            }
        }
        if (s.length() == 0) {
            return true;
        }
        return false;
    }
    
    bool isValid2(string s) {
        Stack<char>* stack = new Stack<char>;
        int len = (int)s.length();
        for (int i = 0; i < len; i++) {
            char c = s[i];
            if (c == '(' || c == '['  || c == '{' ) {
                stack->push(c);
            }else{
                if (stack->isEmpty()) {
                    return false;
                }
                char left = stack->pop();
                if (left == '(' && c != ')') {
                    return false;
                }
                if (left == '[' && c != ']') {
                    return false;
                }
                if (left == '{' && c != '}') {
                    return false;
                }
            }
        }
        return stack->isEmpty();
    }
    
    bool isValid3(string s) {
            stack<char>* stack1 = new stack<char>;
            int len = (int)s.length();
            for (int i = 0; i < len; i++) {
                char c = s[i];
                if (c == '(' || c == '['  || c == '{' ) {
                    stack1->push(c);
                }else{
                    if (stack1->empty()) {
                        return false;
                    }
                    char left = stack1->top();
                    stack1->pop();
                    if (left == '(' && c != ')') {
                        return false;
                    }
                    if (left == '[' && c != ']') {
                        return false;
                    }
                    if (left == '{' && c != '}') {
                        return false;
                    }
                }
            }
            return stack1->empty();
        }
    
   
    
    bool isValid4(string s) {
        
            map<char,char>  chaosMap;
            chaosMap.insert(pair<char, char>('(', ')'));
            chaosMap.insert(pair<char, char>('[', ']'));
            chaosMap.insert(pair<char, char>('{', '}'));
        
            stack<char>* stack1 = new stack<char>;
            int len = (int)s.length();
            for (int i = 0; i < len; i++) {
                char c = s[i];
                std::map<char,char>:: iterator it = chaosMap.find(c);
                if (it != chaosMap.end()) {
                    stack1->push(c);
                }else{
                    if (stack1->empty()) {
                        return false;
                    }
                    char left = stack1->top();
                    stack1->pop();
                    if (c != chaosMap[left]) {
                        return false;
                    }
                }
            }
            return stack1->empty();
        }
};
