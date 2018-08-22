//
//  JKAddressPickerController.m
//  Demo_02
//
//  Created by Jessica on 2018/8/22.
//  Copyright © 2018年 Milton. All rights reserved.
//

#import "JKAddressPickerController.h"
#import "JKAddressManager.h"

@interface JKAddressPickerController ()
@property (nonatomic, strong)JKAddressManager *manager;
@property (nonatomic, assign)JKCityMode mode;
@property (nonatomic, copy)JKCityPicker_Block selected;
@property (nonatomic, copy)JKCityPicker_Block conform;
@end

@implementation JKAddressPickerController{
    NSInteger row_province;
    NSInteger row_city;
    NSInteger row_district;
}

+ (instancetype)pickerWithMode:(JKCityMode)mode
                         title:(NSString *)title
                   didSelected:(JKCityPicker_Block)selected
                       confirm:(JKCityPicker_Block)confirm {
    return [[JKAddressPickerController alloc]initWithMode:mode
                                                 title:title
                                           didSelected:selected
                                               confirm:confirm];
}

- (instancetype)initWithMode:(JKCityMode)mode
                       title:(NSString *)title
                 didSelected:(JKCityPicker_Block)selected
                     confirm:(JKCityPicker_Block)confirm{
    
    self = [super initWithMode:JKPresentMode_Bottom title:title];
    if (self) {
        _selected = selected;
        _conform = confirm;
        _mode = mode;
        _manager = [JKAddressManager manager];
    }
    return self;
}
- (void)initialize {
    row_province = 0;
    row_city = 0;
    row_district = 0;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self initialize];
    [self layoutBackGroundWithHeight:200];
    [self layoutPickerWithHeight:160];
    
}

- (void)sureAction:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:^{
        JKProvince *provoice = self.manager.provinces[row_province];
        JKCity *city = provoice.cities[row_city];
        !self.conform ?: self.conform(provoice.name, city.name , city.districts[row_district]);
    }];
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    if (self.mode == JKCityMode_SSQ) {
        return 3;
    }else {
        return 2;
    }
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    JKProvince *province;
    JKCity *city;
    if (component == 0) {
        return self.manager.provinces.count;
    }else if (component == 1) {
        province = self.manager.provinces[[pickerView selectedRowInComponent:0]];
        return province.cities.count;
    }else {
        province = self.manager.provinces[[pickerView selectedRowInComponent:0]];
        city = province.cities[[pickerView selectedRowInComponent:1]];
        return city.districts.count;
    }
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    JKProvince *province;
    JKCity *city;
    if (component == 0) {
        province = self.manager.provinces[row];
        return province.name;
    }else if (component == 1) {
        province = self.manager.provinces[[pickerView selectedRowInComponent:0]];
        city = province.cities[row];
        return city.name;
    }else {
        province = self.manager.provinces[[pickerView selectedRowInComponent:0]];
        city = province.cities[[pickerView selectedRowInComponent:1]];
        return city.districts[row];
    }
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    if (component == 0) {
        if (_mode == JKCityMode_SSQ) {
            row_province = row;
            row_city = 0;
            row_district = 0;
            [pickerView reloadComponent:1];
            [pickerView selectRow:0 inComponent:1 animated:YES];
            [pickerView reloadComponent:2];
            [pickerView selectRow:0 inComponent:2 animated:YES];
        }else {
            row_province = row;
            [pickerView reloadComponent:1];
            [pickerView selectRow:0 inComponent:1 animated:YES];
            row_city = 0;
        }
    }else if (component == 1) {
        if (_mode == JKCityMode_SSQ) {
            row_city = row;
            row_district = 0;
            [pickerView reloadComponent:2];
            [pickerView selectRow:0 inComponent:2 animated:YES];
        }else {
            row_district = row;
        }
    }else {
        row_district = row;
    }
    JKProvince *provoice = self.manager.provinces[row_province];
    JKCity *city = provoice.cities[row_city];
    !self.selected ?: self.selected(provoice.name , city.name , city.districts[row_district]);
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

@end
