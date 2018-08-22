//
//  JKBackGroundView.h
//  Demo_02
//
//  Created by Jessica on 2018/8/21.
//  Copyright © 2018年 Milton. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JKControlView : UIView

@property (nonatomic, strong , readonly)UIButton *cancel;

@property (nonatomic, strong , readonly)UIButton *sure;

@property (nonatomic, strong , readonly)UILabel *titleLabel;

@end


@interface JKBackGroundView : UIView

@property (nonatomic, strong, readonly)JKControlView *control;

@end
