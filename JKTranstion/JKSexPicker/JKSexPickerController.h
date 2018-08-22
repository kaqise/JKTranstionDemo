//
//  JKSexPickerController.h
//  Demo_02
//
//  Created by Jessica on 2018/8/20.
//  Copyright © 2018年 Milton. All rights reserved.
//

#import "JKTranstionController.h"



@interface JKSexPickerController : JKTranstionController

+ (instancetype)pickerWithTitle:(NSString *)title
                    didSelected:(SexPicker_Block)selected
                        confirm:(SexPicker_Block)confirm;



@end
