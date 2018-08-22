//
//  JKSexPickerController.m
//  Demo_02
//
//  Created by Jessica on 2018/8/20.
//  Copyright © 2018年 Milton. All rights reserved.
//

#import "JKSexPickerController.h"
#import "JKPresentTranstion.h"

@interface JKSexPickerController ()

@property (nonatomic, strong)UIPickerView *sexPicker;

@property (nonatomic, copy)SexPicker_Block selected;

@property (nonatomic, copy)SexPicker_Block confirm;

@end

@implementation JKSexPickerController{
    JKSex sex;
}

+ (instancetype)pickerWithTitle:(NSString *)title
                    didSelected:(SexPicker_Block)selected
                        confirm:(SexPicker_Block)confirm {
    return [[self alloc]initWithTitle:title didSelected:selected confirm:confirm];
}

- (instancetype)initWithTitle:(NSString *)title
                  didSelected:(SexPicker_Block)selected
                      confirm:(SexPicker_Block)confirm {
    self = [super initWithMode:JKPresentMode_Bottom title:title];
    if (self) {
        _selected = selected;
        _confirm = confirm;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    sex = JKSex_Nan;
    [self layoutBackGroundWithHeight:180.0f];
    [self layoutPickerWithHeight:140.0f];
}

- (void)sureAction:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:^{
        !self.confirm ?: self.confirm(sex);
    }];
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return 2;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    if (row == 0) {
        return @"男";
    }else {
        return @"女";
    }
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    if (row == 0) {
        sex = JKSex_Nan;
    }else {
        sex = JKSex_Nv;
    }
    !self.confirm ?: self.confirm(sex);
}

- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view {
    UILabel* pickerLabel = (UILabel*)view;
    if (!pickerLabel){
        pickerLabel = [[UILabel alloc] init];
        pickerLabel.adjustsFontSizeToFitWidth = YES;
        pickerLabel.textColor = [UIColor grayColor];
        pickerLabel.textAlignment = NSTextAlignmentCenter;
        [pickerLabel setFont:[UIFont boldSystemFontOfSize:12]];
    }
    // Fill the label text here
    pickerLabel.text=[self pickerView:pickerView titleForRow:row forComponent:component];
    return pickerLabel;
}

- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component {
    return 40;
}


@end
