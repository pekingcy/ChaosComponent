//
//  tools.hpp
//  ChaosComponent
//
//  Created by jh on 2021/4/16.
//

#ifndef tools_hpp
#define tools_hpp

#include <stdio.h>
#include <sstream>
#include "iostream"
#include "stdlib.h"
#include "vector"
#include "cmath"
#include "algorithm"
#include "map"
#include "fstream"
#include "queue"
#include "unordered_map"
#include "unordered_set"
#include "stack"

namespace tools {
// Binary tree*********************************************************
    /**
     * 中序遍历返回节点数组
     * @param root 根节点
     * @return 中序遍历节点数组
     */
template<typename T>
     vector<BTNode<T> *> inorderTraversal(BTNode<T> *root) {
        std::vector<BTNode<T> *> res;
        std::stack<BTNode<T> *> stk;
        while (root != nullptr || !stk.empty()) {
            while (root != nullptr) {
                stk.push(root);
                root = root->_left;
            }
            root = stk.top();
            stk.pop();
            res.push_back(root);
            root = root->_right;
        }
        return res;
    }

    void trimLeftTrailingSpaces(std::string &input) {
        input.erase(input.begin(), find_if(input.begin(), input.end(), [](int ch) {
            return !isspace(ch);
        }));
    }

    void trimRightTrailingSpaces(std::string &input) {
        input.erase(find_if(input.rbegin(), input.rend(), [](int ch) {
            return !isspace(ch);
        }).base(), input.end());
    }
template<typename T>
BTNode<T> *stringToTreeNode(std::string input) {
        trimLeftTrailingSpaces(input);
        trimRightTrailingSpaces(input);
        input = input.substr(1, input.length() - 2);
        if (!input.size()) {
            return nullptr;
        }

        std::string item;
        std::stringstream ss;
        ss.str(input);

        getline(ss, item, ',');
    BTNode<T> *root = new BTNode<T>(stoi(item));
        std::queue<BTNode<T> *> nodeQueue;
        nodeQueue.push(root);

        while (true) {
            BTNode<T> *node = nodeQueue.front();
            nodeQueue.pop();

            if (!getline(ss, item, ',')) {
                break;
            }

            trimLeftTrailingSpaces(item);
            if (item != "null") {
                int leftNumber = stoi(item);
                node->_left = new BTNode<T>(leftNumber);
                nodeQueue.push(node->_left);
            }

            if (!getline(ss, item, ',')) {
                break;
            }

            trimLeftTrailingSpaces(item);
            if (item != "null") {
                int rightNumber = stoi(item);
                node->_right = new BTNode<T>(rightNumber);
                nodeQueue.push(node->_right);
            }
        }
        return root;
    }
    
    /**
     * 利用下划线和正反斜杠打印出美观的二叉树，没有破坏二叉树结构，但传入的root会有变化
     * @param root  二叉树根节点
     */

template<typename T>
    void printTree(BTNode<T> *root) {
        if (!root)return;
        auto tmp = root;
        std::vector<BTNode<T> *> intv = inorderTraversal(tmp);//中序遍历节点数组
        std::string template_str;//模板string，表示每行打印string的长度
        int location = 0;
        std::unordered_map<BTNode<T> *, int> first_locations;//存储节点对应在本行string中的首位置
        for (auto &i : intv) {
            location = template_str.size();
            template_str += std::to_string(i->element) + " ";
            first_locations[i] = location;
        }
        for (auto &i:template_str)i = ' ';//把模板全部置为空格方便后续使用
        //层序遍历
        std::queue<BTNode<T> *> q;
        q.push(root);
        while (!q.empty()) {
            int currentLevelSize = q.size();
            int cur_loc = 0;
            std::string tmp_str1 = template_str, tmp_str2 = template_str;//1为节点所在行，2为其下一行
            for (int i = 1; i <= currentLevelSize; ++i) {
                auto node = q.front();
                q.pop();
                cur_loc = first_locations[node];
                std::string num_str = std::to_string(node->element);
                //左边，如果存在左孩子，那么在第二行对应位置打印'/'，在第一行补上'_'
                if (node->_left) {
                    q.push(node->_left);
                    int first_loc = first_locations[node->_left] + 1;
                    tmp_str2[first_loc++] = '/';
                    while (first_loc < cur_loc)tmp_str1[first_loc++] = '_';

                }
                //中间,对应位置打印节点值（有可能为多位数）
                for (int j = 0; j < num_str.length(); ++j, ++cur_loc) {
                    tmp_str1[cur_loc] = num_str[j];
                }
                //右边，如果存在右孩子，那么在第二行对应位置打印'\'，在第一行补上'_'
                if (node->_right) {
                    q.push(node->_right);
                    int last_loc = first_locations[node->_right] - 1;
                    tmp_str2[last_loc] = '\\';
                    while (cur_loc < last_loc) {
                        tmp_str1[cur_loc++] = '_';
                    }
                }
            }
            //打印两行
            std::cout << tmp_str1 << std::endl;
            std::cout << tmp_str2 << std::endl;
        }
    }

}

#endif /* tools_hpp */
