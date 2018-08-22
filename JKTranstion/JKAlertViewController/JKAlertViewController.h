//
//  JKAlertViewController.h
//  Demo_02
//
//  Created by Jessica on 2018/8/14.
//  Copyright © 2018年 Milton. All rights reserved.
//

#import "JKTranstionController.h"

@interface JKAlertViewController : JKTranstionController

+ (instancetype)alertControllerWithTitle:(NSString *)title
                                 actions:(NSArray <NSString *> *)actions
                                handlers:(void(^)(NSInteger idx))handlers;



@end


