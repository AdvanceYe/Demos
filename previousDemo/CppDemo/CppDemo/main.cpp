//
//  main.cpp
//  CppDemo
//
//  Created by yeye(* ￣＾￣) on 2019/2/28.
//  Copyright © 2019年 com.test. All rights reserved.
//

#include <iostream>
#include <utility>


int main(int argc, const char * argv[]) {
    // insert code here...
    std::cout << "Hello, World!\n";
    
    //https://blog.csdn.net/caroline_wendy/article/details/15029287
    int i = 42;
    int &lr = i;
    int &&rr = i*42;
    const int &lr1 = i*42;
    int &&rr1 = 42;
    int &&rr2 = std::move(lr);
    std::cout << "i = " << i << std::endl;
    std::cout << "lr = " << lr << std::endl;
    std::cout << "rr = " << rr << std::endl;
    std::cout << "lr1 = " << lr1  <<std::endl;
    std::cout << "rr1  = " << rr1  << std::endl;
    std::cout << "rr2  = " << rr2  << std::endl;
    
    
    return 0;
}
