//
//  main.m
//  BuDeJie
//
//  Created by lipeng feng on 2019/8/22.
//  Copyright © 2019 lipeng feng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

int main(int argc, char * argv[]) {
    @autoreleasepool {
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}


/**
 UIApplicationMain作用:
 1.创建UIApplication(作用:1.打开网页，发短信，打电话。2.设置应用程序的提醒数字.3.设置联网状态。4.设置状态栏)
 2.创建一个AppDelegate并且成为我们UIApplication代理，可以监听整个app的声明周期，处理内存警告
 3.开始一个主运行循环,保证程序一直运行
 4.加载info.plist文件，判断是否指定了Main.storyboard，如果指定了就去加载Main.storyboard
 **/
