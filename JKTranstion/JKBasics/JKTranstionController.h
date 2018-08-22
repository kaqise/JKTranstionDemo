//
//  JKTranstionController.h
//  Demo_02
//
//  Created by Jessica on 2018/8/21.
//  Copyright © 2018年 Milton. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JKBackGroundView.h"
#import "JKPresentTranstion.h"
#import "JKTranstionControllProtocol.h"

@interface JKTranstionController : UIViewController<UIPickerViewDataSource,UIPickerViewDelegate,JKTranstionControllProtocol>

@property (nonatomic, strong , readonly)JKBackGroundView *backGround;

@property (nonatomic, strong , readonly)UIPickerView *pickerView;

@property (nonatomic, strong)UIColor *titleColor;

@property (nonatomic, strong)UIFont *titleFont;

- (void)layoutBackGroundWithHeight:(CGFloat)height;

- (void)layoutPickerWithHeight:(CGFloat)height;

- (instancetype)initWithMode:(JKPresentMode)mode title:(NSString *)title;

- (instancetype)initWithMode:(JKPresentMode)mode;

@end
