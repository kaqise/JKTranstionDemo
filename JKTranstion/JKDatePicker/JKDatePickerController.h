//
//  JKDatePickerController.h
//  Demo_02
//
//  Created by Jessica on 2018/8/14.
//  Copyright © 2018年 Milton. All rights reserved.
//

#import "JKTranstionController.h"

@interface JKDatePickerController : JKTranstionController

+ (instancetype)pickerWithMode:(JKDateMode )mode
                         title:(NSString *)title
                   didSelected:(JKDatePicker_Block)selected
                       confirm:(JKDatePicker_Block)confirm;


@end
