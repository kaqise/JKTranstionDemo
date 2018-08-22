//
//  JKTranstionControllProtocol.h
//  Demo_02
//
//  Created by Jessica on 2018/8/21.
//  Copyright © 2018年 Milton. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol JKTranstionControllProtocol <NSObject>

typedef NS_ENUM(NSInteger , JKSex) {
    JKSex_Nan,//男
    JKSex_Nv,//女
};
typedef void(^SexPicker_Block)(JKSex sex);


typedef NS_ENUM(NSInteger , JKCityMode) {
    JKCityMode_SSQ,//省市区
    JKCityMode_SS,//省市
};
typedef void(^JKCityPicker_Block)(NSString *provoice , NSString *city , NSString *district);

typedef NS_ENUM(NSInteger , JKDateMode) {
    DateMode_YMD,//年月日
    DateMode_MD,//月日
};
typedef void(^JKDatePicker_Block)(NSDate *date);

@required
//确定事件
- (void)sureAction:(UIButton *)sender ;

@end
