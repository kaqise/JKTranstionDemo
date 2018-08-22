//
//  JKDatePickerController.m
//  Demo_02
//
//  Created by Jessica on 2018/8/14.
//  Copyright © 2018年 Milton. All rights reserved.
//

#import "JKDatePickerController.h"
#import "JKDateMananger.h"

static NSInteger before = 50;
static NSInteger later = 50;

@interface JKDatePickerController ()
@property (nonatomic, assign)JKDateMode mode;
@property (nonatomic, copy)JKDatePicker_Block selected;
@property (nonatomic, copy)JKDatePicker_Block confirm;
@end

@implementation JKDatePickerController{
    NSInteger year;//年
    NSInteger month;//月
    NSInteger day;//日
    NSDate *pichDate;//选中日期
}
+ (instancetype)pickerWithMode:(JKDateMode)mode
                         title:(NSString *)title
                   didSelected:(JKDatePicker_Block)selected
                       confirm:(JKDatePicker_Block)confirm {
    return [[JKDatePickerController alloc]initWithMode:mode title:title didSelected:selected confirm:confirm];
}
- (instancetype)initWithMode:(JKDateMode)mode
                       title:(NSString *)title
                 didSelected:(JKDatePicker_Block)selected
                     confirm:(JKDatePicker_Block)confirm {
    self = [super initWithMode:JKPresentMode_Bottom title:title];
    if (self) {
        _selected = selected;
        _confirm = confirm;
        _mode = mode;
    }
    return self;
}
- (void)initialize {
    pichDate = [NSDate date];
    year = [JKDateMananger currentYear];
    month = [JKDateMananger currentMonth];
    day = [JKDateMananger currentDay];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self initialize];
    [self layoutBackGroundWithHeight:200.0f];
    [self layoutPickerWithHeight:160.0f];
    if (_mode == DateMode_YMD) {
        [self.pickerView selectRow:before inComponent:0 animated:YES];
        [self.pickerView selectRow:month - 1 inComponent:1 animated:YES];
        [self.pickerView selectRow:day - 1 inComponent:2 animated:YES];
    }else {
        [self.pickerView selectRow:month - 1 inComponent:0 animated:YES];
        [self.pickerView selectRow:day - 1 inComponent:1 animated:YES];
    }
}
- (void)sureAction:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:^{
        !self.confirm ?: self.confirm(self->pichDate);
    }];
}
#pragma mark - UIPickViewDataSource

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    switch (_mode) {
        case DateMode_YMD:
            return 3;
            break;
        default:
            return 2;
            break;
    }
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    if (self.mode == DateMode_YMD) {
        if (component == 0) {//指定年内的时间表
            NSInteger year = [JKDateMananger currentYear];
            return [JKDateMananger getYeasFromYear:year - before toYear:year + later];
        }else if (component == 1) {
            return 12;
        }else {
            NSInteger row_year = [pickerView selectedRowInComponent:0];
            NSInteger year = [JKDateMananger currentYear] - before + row_year;
            NSInteger row_month = [pickerView selectedRowInComponent:1];
            NSInteger month = row_month + 1;
            return [JKDateMananger getDaysWithYear:year month:month];
        }
    }else {
        if (component == 0) {
            return 12;
        }else {
            NSInteger row_month = [pickerView selectedRowInComponent:0];
            NSInteger month = row_month + 1;
            return [JKDateMananger getDaysWithYear:[JKDateMananger currentYear] month:month];
        }
    }
}

#pragma mark - UIPickerViewDelegate

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    if (self.mode == DateMode_YMD) {
        if (component == 0) {
            NSInteger year = [JKDateMananger currentYear] - before + row;
            return [NSString stringWithFormat:@"%ld年",year];
        }else if (component == 1) {
            NSInteger month = row + 1;
            return [NSString stringWithFormat:@"%ld月",month];
        }else {
            NSInteger day = row + 1;
            return [NSString stringWithFormat:@"%ld日",day];
        }
    }else {
        if (component == 0) {
            NSInteger month = row + 1;
            return [NSString stringWithFormat:@"%ld月", month];
        }else {
            NSInteger day = row + 1;
            return [NSString stringWithFormat:@"%ld日", day];
        }
    }
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    if (_mode == DateMode_YMD) {
        if (component == 0) {
            year = [JKDateMananger currentYear] - before + row;
        }else if (component == 1) {
            month = row + 1;
        }else {
            day = row + 1;
        }
        pichDate = [JKDateMananger dateWithYear:year month:month day:day];
    }else {
        if (component == 0) {
            month = row + 1;
        }else {
            day = row + 1;
        }
        pichDate = [JKDateMananger dateWithYear:year month:month day:day];
    }
    !self.selected ?: self.selected(pichDate);
    [pickerView reloadAllComponents];
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
    pickerLabel.text=[self pickerView:pickerView titleForRow:row forComponent:component];
    return pickerLabel;
}




@end
