//
//  ViewController.m
//  JKTranstionDemo
//
//  Created by Jessica on 2018/8/22.
//  Copyright © 2018年 Milton. All rights reserved.
//

#import "ViewController.h"
#import "JKTranstionHeader.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    for (NSInteger i = 0; i < 4; i ++) {
        UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(30, 100 + 120 * i, self.view.bounds.size.width - 60, 60)];
        [button setBackgroundColor:[UIColor redColor]];
        [button setTag:i];
        [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchDown];
        [button setTitle:@[@"选择地址",@"选择时间",@"选择性别",@"自定义"][i] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [self.view addSubview:button];
    }
    
}

- (void)buttonClick:(UIButton *)sender {
    switch (sender.tag) {
        case 0:
        {
            JKAddressPickerController *city = [JKAddressPickerController pickerWithMode:JKCityMode_SSQ title:sender.titleLabel.text didSelected:^(NSString *provoice, NSString *city, NSString *district) {
                NSLog(@"%@---%@---%@",provoice,city,district);
            } confirm:^(NSString *provoice, NSString *city, NSString *district) {
                NSLog(@"%@---%@---%@",provoice,city,district);
            }];
            [self presentViewController:city animated:YES completion:nil];
        }
            break;
        case 1:
        {
            JKDatePickerController *date = [JKDatePickerController pickerWithMode:DateMode_YMD title:sender.titleLabel.text didSelected:^(NSDate *date) {
                NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
                formatter.dateFormat = @"yyyy-MM-dd HH:mm:ss";
                NSString *str = [formatter stringFromDate:date];
                NSLog(@"%@",str);
            } confirm:^(NSDate *date) {
                NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
                formatter.dateFormat = @"yyyy-MM-dd HH:mm:ss";
                NSString *str = [formatter stringFromDate:date];
                NSLog(@"%@",str);
            }];
            [self presentViewController:date animated:YES completion:nil];
        }
            break;
        case 2:
        {
            JKSexPickerController *sex = [JKSexPickerController pickerWithTitle:sender.titleLabel.text didSelected:^(JKSex sex) {
                NSLog(@"%@",sex ? @"女" : @"男");
            } confirm:^(JKSex sex) {
                NSLog(@"%@",sex ? @"女" : @"男");
            }];
            [self presentViewController:sex animated:YES completion:nil];
        }
            break;
        default:
        {
            JKAlertViewController *alert = [JKAlertViewController alertControllerWithTitle:sender.titleLabel.text actions:@[@"拍照",@"相册"] handlers:^(NSInteger idx) {
                if (idx) {
                    NSLog(@"拍照");
                }else {
                    NSLog(@"相册");
                }
            }];
            [self presentViewController:alert animated:YES completion:nil];
            
        }
            break;
    }
}


@end
