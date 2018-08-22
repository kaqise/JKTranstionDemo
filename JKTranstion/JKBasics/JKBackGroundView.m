//
//  JKBackGroundView.m
//  Demo_02
//
//  Created by Jessica on 2018/8/21.
//  Copyright © 2018年 Milton. All rights reserved.
//

#import "JKBackGroundView.h"

@interface JKControlView()

@property (nonatomic, strong , readwrite)UIButton *cancel;

@property (nonatomic, strong , readwrite)UIButton *sure;

@property (nonatomic, strong , readwrite)UILabel *titleLabel;

@end

@implementation JKControlView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.titleLabel = [[UILabel alloc]init];
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        self.titleLabel.font = [UIFont systemFontOfSize:16];
        self.titleLabel.textColor = [UIColor blackColor];
        self.titleLabel.text = @"选择";
        
        self.cancel = [[UIButton alloc]init];
        [self.cancel setTitle:@"取消" forState:UIControlStateNormal];
        [self.cancel setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        self.cancel.titleLabel.font = [UIFont systemFontOfSize:14];
       
        self.sure = [[UIButton alloc]init];
        [self.sure setTitle:@"确定" forState:UIControlStateNormal];
        [self.sure setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        self.sure.titleLabel.font = [UIFont systemFontOfSize:14];
        
        [self addSubview:self.titleLabel];
        [self addSubview:self.cancel];
        [self addSubview:self.sure];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    _titleLabel.frame = CGRectMake(0, 0, 200, 40);
    _titleLabel.center = CGPointMake(self.center.x, 20);
    _cancel.frame = CGRectMake(10, 0, 60, 40);
    _sure.frame = CGRectMake(self.bounds.size.width - 70, 0, 60, 40);
}

@end

@interface JKBackGroundView ()

@property (nonatomic, strong, readwrite)JKControlView *control;

@end

@implementation JKBackGroundView

- (JKControlView *)control {
    if (_control == nil) {
        _control = [[JKControlView alloc]init];
    }
    return _control;
}
- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.control];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    [_control setFrame:CGRectMake(0, 0, self.bounds.size.width, 40)];
}



@end
