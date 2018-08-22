//
//  JKAlertViewController.m
//  Demo_02
//
//  Created by Jessica on 2018/8/14.
//  Copyright © 2018年 Milton. All rights reserved.
//

#import "JKAlertViewController.h"
//34
@interface JKAlertViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, copy)NSString *titleText;
@property (nonatomic, strong)NSArray <NSString *> *actions;
@property (nonatomic, strong)UITableView *tableView;
/** 点击回调 */
@property (nonatomic, copy)void((^handlers)(NSInteger idx));

@end

@implementation JKAlertViewController

+ (instancetype)alertControllerWithTitle:(NSString *)title
                                 actions:(NSArray<NSString *> *)actions
                                handlers:(void (^)(NSInteger))handlers {
    return [[JKAlertViewController alloc]initWithTitle:title
                                               actions:actions
                                              handlers:handlers];
}
- (instancetype)initWithTitle:(NSString *)title
                      actions:(NSArray<NSString *> *)actions
                     handlers:(void (^)(NSInteger))handlers{
    self = [super initWithMode:JKPresentMode_Bottom];
    if (self) {
        self.titleText = title;
        self.actions = actions;
        self.handlers = handlers;
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self handleBottom];
}
- (void)handleBottom {
    CGFloat header_height = 40.0f;
    CGFloat cancel_height = is_phoneX ? 34.0f + 45.0f : 45.0f;
    CGFloat sectionHeader_height = 8.0f;
    CGFloat cell_height = 40.0f;
    CGFloat tableView_height = _actions.count * cell_height + header_height + sectionHeader_height + cancel_height;
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, CGRectGetHeight(self.view.bounds) - tableView_height, CGRectGetWidth(self.view.bounds), tableView_height) style:UITableViewStyleGrouped];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.tableView.separatorInset = UIEdgeInsetsZero;
    [self.tableView registerClass:[UITableViewHeaderFooterView class] forHeaderFooterViewReuseIdentifier:@"UITableViewHeaderFooterView"];
    self.tableView.separatorColor = [UIColor groupTableViewBackgroundColor];
    //头视图
    UILabel *header = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.bounds), header_height)];
    header.textColor = [UIColor blackColor];
    header.backgroundColor = [UIColor whiteColor];
    header.font = [UIFont boldSystemFontOfSize:14];
    header.textAlignment = NSTextAlignmentCenter;
    header.text = _titleText;
    self.tableView.tableHeaderView = header;
    self.tableView.tableFooterView = [UIView new];
    [self.view addSubview:self.tableView];
    self.tableView.tag = 1;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return _actions.count;
    }else {
        return 1;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identifier = @"actionCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        cell.textLabel.font = [UIFont systemFontOfSize:16];
        cell.textLabel.textColor = [UIColor grayColor];
        cell.textLabel.textAlignment = NSTextAlignmentCenter;
    }
    if (indexPath.section == 0) {
        cell.textLabel.text = _actions[indexPath.row];
    }else {
        cell.textLabel.text = @"取消";
    }
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        return 40.0f;
    }else {
        return is_phoneX ? 34.0f + 45.0f : 45.0f;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        return CGFLOAT_MIN;
    }else {
        return 6.0f;
    }
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        return nil;
    }else {
        UITableViewHeaderFooterView *header = [tableView dequeueReusableHeaderFooterViewWithIdentifier:@"UITableViewHeaderFooterView"];
        header.contentView.backgroundColor = [UIColor clearColor];
        return header;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return CGFLOAT_MIN;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    return nil;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        [self dismissViewControllerAnimated:YES completion:^{
            !self.handlers ?: self.handlers(indexPath.row);
        }];
    }else {
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}


@end
