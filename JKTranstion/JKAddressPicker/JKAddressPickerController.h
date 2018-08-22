//
//  JKAddressPickerController.h
//  Demo_02
//
//  Created by Jessica on 2018/8/22.
//  Copyright © 2018年 Milton. All rights reserved.
//

#import "JKTranstionController.h"

@interface JKAddressPickerController : JKTranstionController

+ (instancetype)pickerWithMode:(JKCityMode)mode
                         title:(NSString *)title
                   didSelected:(JKCityPicker_Block)selected
                       confirm:(JKCityPicker_Block)confirm;

@end
