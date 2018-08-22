//
//  JKPresentTranstion.h
//  Demo_02
//
//  Created by Jessica on 2018/8/14.
//  Copyright © 2018年 Milton. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#define is_phoneX ([UIScreen mainScreen].bounds.size.height == 812.0 ? true : false)

typedef NS_ENUM(NSInteger , JKPresentMode) {
    JKPresentMode_Bottom,//底部弹出
    JKPresentMode_Center,//顶部弹出
};

@interface JKPresentTranstion : NSObject<UIViewControllerTransitioningDelegate>
//底部
+ (instancetype)bottomDefault;
//中心
+ (instancetype)centerDefault;



@end
