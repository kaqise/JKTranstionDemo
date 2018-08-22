//
//  JKTranstionController.m
//  Demo_02
//
//  Created by Jessica on 2018/8/21.
//  Copyright © 2018年 Milton. All rights reserved.
//

#import "JKTranstionController.h"

@interface JKTranstionController ()

@property (nonatomic, strong , readwrite)JKBackGroundView *backGround;

@property (nonatomic, copy)NSString *titleText;

@property (nonatomic, strong)JKPresentTranstion *transtion;

@property (nonatomic, strong , readwrite)UIPickerView *pickerView;

@end

@implementation JKTranstionController

- (instancetype)initWithMode:(JKPresentMode)mode {
    self = [super init];
    if (self) {
        self.modalPresentationStyle = UIModalPresentationCustom;
        JKPresentTranstion *transition;
        if (mode == JKPresentMode_Bottom) {
            transition = [JKPresentTranstion bottomDefault];
        }else {
            transition = [JKPresentTranstion centerDefault];
        }
        self.transitioningDelegate = transition;
        self.transtion = transition;
    }
    return self;
}

- (instancetype)initWithMode:(JKPresentMode)mode title:(NSString *)title{
    self = [super init];
    if (self) {
        self.modalPresentationStyle = UIModalPresentationCustom;
        JKPresentTranstion *transition;
        if (mode == JKPresentMode_Bottom) {
            transition = [JKPresentTranstion bottomDefault];
        }else {
            transition = [JKPresentTranstion centerDefault];
        }
        self.transitioningDelegate = transition;
        self.transtion = transition;
        _titleText = title;
    }
    return self;
}

- (JKBackGroundView *)backGround {
    if (_backGround == nil) {
        _backGround = [[JKBackGroundView alloc]init];
        _backGround.tag = 1;
        _backGround.backgroundColor = [UIColor whiteColor];
    }
    return _backGround;
}

- (UIPickerView *)pickerView {
    if (_pickerView == nil) {
        _pickerView = [[UIPickerView alloc]init];
        [_pickerView setDataSource:self];
        [_pickerView setDelegate:self];
        [_pickerView setBackgroundColor:[UIColor whiteColor]];
    }
    return _pickerView;
}

- (void)layoutBackGroundWithHeight:(CGFloat)height {
    
    [self.view addSubview:self.backGround];
    CGFloat safe_height = is_phoneX ? height + 34.0f : height;
    self.backGround.frame = CGRectMake(0, self.view.bounds.size.height - safe_height, self.view.bounds.size.width, safe_height);
    self.backGround.control.titleLabel.text = _titleText;
    [self.backGround.control.cancel addTarget:self action:@selector(cancelAction:) forControlEvents:UIControlEventTouchDown];
    [self.backGround.control.sure addTarget:self action:@selector(sureAction:) forControlEvents:UIControlEventTouchDown];
}

- (void)layoutPickerWithHeight:(CGFloat)height {
    [self.backGround addSubview:self.pickerView];
    self.pickerView.frame = CGRectMake(0, 40, self.view.bounds.size.width, height);
}

- (void)cancelAction:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 0;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return 0;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapAction:)];
    [self.view addGestureRecognizer:tap];
    
}

- (void)tapAction:(UITapGestureRecognizer *)tap {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)sureAction:(UIButton *)sender {

}

- (void)setTitleColor:(UIColor *)titleColor {
    _titleColor = titleColor;
    self.backGround.control.titleLabel.textColor = titleColor;
}

- (void)setTitleFont:(UIFont *)titleFont {
    _titleFont = titleFont;
    self.backGround.control.titleLabel.font = titleFont;
}


@end
