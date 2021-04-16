//
//  ChaosDataStructureViewController.m
//  ChaosComponent
//
//  Created by 柴志勇 on 2021/3/28.
//

#import "ChaosDataStructureViewController.h"
//#include "LinkedList.cpp"
//#include "Stack.cpp"
//#include <map>
//#include <stack>
//#include "CircleQueue.hpp"
//#include "BinarySearchTree.hpp"
//#include "tools.cpp"

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


//Definition for a binary tree node.
struct TreeNode {
    int val;
    TreeNode *left;
    TreeNode *right;

    TreeNode() : val(0), left(nullptr), right(nullptr) {}

    TreeNode(int x) : val(x), left(nullptr), right(nullptr) {}

    TreeNode(int x, TreeNode *left, TreeNode *right) : val(x), left(left), right(right) {}
};

namespace tools {
// Binary tree*********************************************************
    /**
     * 中序遍历返回节点数组
     * @param root 根节点
     * @return 中序遍历节点数组
     */
    std::vector<TreeNode *> inorderTraversal(TreeNode *root) {
        std::vector<TreeNode *> res;
        std::stack<TreeNode *> stk;
        while (root != nullptr || !stk.empty()) {
            while (root != nullptr) {
                stk.push(root);
                root = root->left;
            }
            root = stk.top();
            stk.pop();
            res.push_back(root);
            root = root->right;
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

    TreeNode *stringToTreeNode(std::string input) {
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
        TreeNode *root = new TreeNode(stoi(item));
        std::queue<TreeNode *> nodeQueue;
        nodeQueue.push(root);

        while (true) {
            TreeNode *node = nodeQueue.front();
            nodeQueue.pop();

            if (!getline(ss, item, ',')) {
                break;
            }

            trimLeftTrailingSpaces(item);
            if (item != "null") {
                int leftNumber = stoi(item);
                node->left = new TreeNode(leftNumber);
                nodeQueue.push(node->left);
            }

            if (!getline(ss, item, ',')) {
                break;
            }

            trimLeftTrailingSpaces(item);
            if (item != "null") {
                int rightNumber = stoi(item);
                node->right = new TreeNode(rightNumber);
                nodeQueue.push(node->right);
            }
        }
        return root;
    }
    
    /**
     * 利用下划线和正反斜杠打印出美观的二叉树，没有破坏二叉树结构，但传入的root会有变化
     * @param root  二叉树根节点
     */
    void printTree(TreeNode *root) {
        if (!root)return;
        auto tmp = root;
        std::vector<TreeNode *> intv = inorderTraversal(tmp);//中序遍历节点数组
        std::string template_str;//模板string，表示每行打印string的长度
        int location = 0;
        std::unordered_map<TreeNode *, int> first_locations;//存储节点对应在本行string中的首位置
        for (auto &i : intv) {
            location = template_str.size();
            template_str += std::to_string(i->val) + " ";
            first_locations[i] = location;
        }
        for (auto &i:template_str)i = ' ';//把模板全部置为空格方便后续使用
        //层序遍历
        std::queue<TreeNode *> q;
        q.push(root);
        while (!q.empty()) {
            int currentLevelSize = q.size();
            int cur_loc = 0;
            std::string tmp_str1 = template_str, tmp_str2 = template_str;//1为节点所在行，2为其下一行
            for (int i = 1; i <= currentLevelSize; ++i) {
                auto node = q.front();
                q.pop();
                cur_loc = first_locations[node];
                std::string num_str = std::to_string(node->val);
                //左边，如果存在左孩子，那么在第二行对应位置打印'/'，在第一行补上'_'
                if (node->left) {
                    q.push(node->left);
                    int first_loc = first_locations[node->left] + 1;
                    tmp_str2[first_loc++] = '/';
                    while (first_loc < cur_loc)tmp_str1[first_loc++] = '_';

                }
                //中间,对应位置打印节点值（有可能为多位数）
                for (int j = 0; j < num_str.length(); ++j, ++cur_loc) {
                    tmp_str1[cur_loc] = num_str[j];
                }
                //右边，如果存在右孩子，那么在第二行对应位置打印'\'，在第一行补上'_'
                if (node->right) {
                    q.push(node->right);
                    int last_loc = first_locations[node->right] - 1;
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
 //   test2();
    test3();
}

//static void test2() {
//    CircleQueue<int> *queue = new CircleQueue<int>();
//    // 0 1 2 3 4 5 6 7 8 9
//    for (int i = 0; i < 10; i++) {
//        queue->enQueue(i);
//    }
//    // null null null null null 5 6 7 8 9
//    for (int i = 0; i < 5; i++) {
//        queue->deQueue();
//    }
////    // 15 16 17 18 19 5 6 7 8 9
//    for (int i = 15; i < 20; i++) {
//        queue->enQueue(i);
//    }
////    while (!queue->isEmpty()) {
////        cout << queue->deQueue() <<endl;
////    }
//    cout << queue->toString() <<endl;
//}

void test3(){
//    BinarySearchTree<int>* bTree = new BinarySearchTree<int>(nullptr);
//    bTree->add(23);
//    bTree->add(17);
//    bTree->add(15);
//    bTree->add(22);
//    bTree->add(20);
//    bTree->add(14);
//    bTree->add(6);
//    delete bTree;
    
    tools::printTree(tools::stringToTreeNode("[1,1,1,1,1,1,1,11,3,213,21,13,21,31,321,321,654,684,1,87,94,1,1687,941,4,984,21,65,4987]"));
}

@end
