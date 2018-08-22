//
//  JKAddressManager.h
//  Demo_02
//
//  Created by Jessica on 2018/8/22.
//  Copyright © 2018年 Milton. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JKCity : NSObject

/** 市 */
@property (nonatomic, copy)NSString *name;

/** 区列表 */
@property (nonatomic, strong)NSArray <NSString *>*districts;

@end

@interface JKProvince : NSObject

/** 省 */
@property (nonatomic, copy)NSString *name;

/** 市列表 */
@property (nonatomic, strong)NSArray <JKCity *>*cities;

@end

@interface JKAddressManager : NSObject
//单例
+ (instancetype)manager;

/** 省列表 */
@property (nonatomic, strong)NSArray <JKProvince *> *provinces;

@end
