//
//  JKPresentTranstion.m
//  Demo_02
//
//  Created by Jessica on 2018/8/14.
//  Copyright © 2018年 Milton. All rights reserved.
//

#import "JKPresentTranstion.h"

#define kCustomPresentTransitionDurtion 0.4

typedef NS_ENUM(NSInteger , JKPresentTransitionStatus) {
    JKPresentTransitionStatus_Present,//弹出
    JKPresentTransitionStatus_Dissmiss,//销毁
};

@interface JKPresentTranstion()<UIViewControllerAnimatedTransitioning>
//弹出模式
@property (nonatomic, assign)JKPresentMode mode;
//当前状态
@property (nonatomic, assign)JKPresentTransitionStatus status;

@end

@implementation JKPresentTranstion

+ (instancetype)bottomDefault {
    return [[JKPresentTranstion alloc]initTranstionWithMode:JKPresentMode_Bottom];
}

+ (instancetype)centerDefault {
    return [[JKPresentTranstion alloc]initTranstionWithMode:JKPresentMode_Center];
}

- (instancetype)initTranstionWithMode:(JKPresentMode)mode {
    self = [super init];
    if (self) {
        _mode = mode;
    }
    return self;
}


#pragma mark - UIViewControllerTransitioningDelegate
//present实现者
- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source{
    _status = JKPresentTransitionStatus_Present;
    return self;
}
//dismiss实现者
- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed{
    _status = JKPresentTransitionStatus_Dissmiss;
    return self;
}
//动画时长
- (NSTimeInterval)transitionDuration:(nullable id<UIViewControllerContextTransitioning>)transitionContext {
    return kCustomPresentTransitionDurtion;
}
//具体执行事件
- (void)animateTransition:(nonnull id<UIViewControllerContextTransitioning>)transitionContext {
    UIViewController *to_vc = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIViewController *from_vc = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    if (!to_vc || !from_vc) return;//两个控制器有一个为空 不进行跳转相关操作
    switch (_status) {
        case JKPresentTransitionStatus_Present:
            [self jk_presentTransition:transitionContext fromViewController:from_vc toController:to_vc];
            break;
        case JKPresentTransitionStatus_Dissmiss:
            [self jk_dissmissTransition:transitionContext fromViewController:from_vc toController:to_vc];
            break;
        default:
            break;
    }
}

//弹出
- (void)jk_presentTransition:(id<UIViewControllerContextTransitioning>)transitionContext fromViewController:(UIViewController *)fromController toController:(UIViewController *)toController {
    // 模态时系统生成的容器视图
    UIView *container = [transitionContext containerView];
    // 控制器.View
    UIView *to_view = toController.view;
    to_view.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.0];
    // 目标视图
    UIView  *will_Move = [to_view viewWithTag:1];
    //将目标视图添加到容器上
    [container addSubview:to_view];
    
    if (_mode == JKPresentMode_Center) {//中间弹出动画
        
        will_Move.transform = CGAffineTransformMakeScale(1.2, 1.2);
        [UIView animateWithDuration:kCustomPresentTransitionDurtion
                              delay:0
             usingSpringWithDamping:0.7
              initialSpringVelocity:0.5
                            options:UIViewAnimationOptionCurveEaseIn
                         animations:^{
            
            to_view.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.6];
            will_Move.transform = CGAffineTransformMakeScale(1, 1);
            
        } completion:^(BOOL finished) {
            [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
        }];
        
    }else {//底部弹出动画
        
        // 保存目标是图的初始位置
        CGRect rect = will_Move.frame;
        //将目标视图移动到底部屏幕外
        will_Move.frame = CGRectMake(rect.origin.x, [UIScreen mainScreen].bounds.size.height, rect.size.width, rect.size.height);
        [UIView animateWithDuration:kCustomPresentTransitionDurtion animations:^{
            to_view.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.4];
            will_Move.frame = rect;
        } completion:^(BOOL finished) {
            [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
        }];
    }
    
}

//销毁
- (void)jk_dissmissTransition:(id<UIViewControllerContextTransitioning>)transitionContext fromViewController:(UIViewController *)fromController toController:(UIViewController *)toController {
    
    UIView *from_view = fromController.view;
    UIView *will_Move = [from_view viewWithTag:1];
    
    if (_mode == JKPresentMode_Center) {//中间弹出动画
        [UIView animateWithDuration:kCustomPresentTransitionDurtion delay:0.0 options:UIViewAnimationOptionTransitionNone
                         animations:^{
                             from_view.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.0];
                             will_Move.alpha = 0;
                         }completion:^(BOOL finished) {
                             [from_view removeFromSuperview];
                             [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
                         }
         ];
        
    } else {//底部弹出动画
        //记录初始位置
        CGRect rect = will_Move.frame;
        
        [UIView animateWithDuration:kCustomPresentTransitionDurtion animations:^{
            from_view.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.0];
            will_Move.frame = CGRectMake(rect.origin.x, [UIScreen mainScreen].bounds.size.height, rect.size.width, rect.size.height);
        } completion:^(BOOL finished) {
            [from_view removeFromSuperview];
            [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
        }];
        
    }
}



@end
