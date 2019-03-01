//
//  main.cpp
//  lc99
//
//  Created by yeye(* ￣＾￣) on 2019/2/6.
//  Copyright © 2019年 com.test. All rights reserved.
//

#include <iostream>

int main(int argc, const char * argv[]) {
    // insert code here...
    std::cout << "Hello, World!\n";
    
    return 0;
}

/**
 * Definition for a binary tree node.
 * struct TreeNode {
 *     int val;
 *     TreeNode *left;
 *     TreeNode *right;
 *     TreeNode(int x) : val(x), left(NULL), right(NULL) {}
 * };
 */

struct TreeNode {
    int val;
    TreeNode *left;
    TreeNode *right;
    TreeNode(int x) : val(x), left(NULL), right(NULL) {}
};

class Solution {
public:
    TreeNode *first, *second, *prev;
    void recoverTree(TreeNode* root) {
        first = second = prev = NULL;
        dfs(root);
    }
    
    void dfs(TreeNode *root) {
        if (root->left != NULL) {
            dfs(root->left);
        }
        if (prev != NULL && prev->val > root->val) {
            if (first == NULL) {
                first = prev;
                second = root;
            } else {
                second = root;
            }
        }
        prev = root;
        if (root->right != NULL) {
            dfs(root->right);
        }
    }
};


class Solution {
public:
    int largestRectangleArea(vector<int>& heights) {
        vector<int> nums;
        for (int i = 0; i < heights.size(); i++) {
            nums[i] = 1;
            if (height[i] >= height[i - 1]) {
                nums[i]++;
            }
        }
        
    }
};
