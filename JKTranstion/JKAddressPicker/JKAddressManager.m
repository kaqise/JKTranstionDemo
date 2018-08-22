//
//  JKAddressManager.m
//  Demo_02
//
//  Created by Jessica on 2018/8/22.
//  Copyright © 2018年 Milton. All rights reserved.
//

#import "JKAddressManager.h"

@implementation JKCity

@end

@implementation JKProvince

@end

@implementation JKAddressManager

+ (instancetype)manager {
    return [[JKAddressManager alloc]init];
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"Address" ofType:@"plist"];
        NSDictionary *plistDic = [NSDictionary dictionaryWithContentsOfFile:path];
        self.provinces = [self getProvincesWithPlistDic:plistDic];
    }
    return self;
}

- (NSArray <JKProvince *> *)getProvincesWithPlistDic:(NSDictionary *)dic {
    NSMutableArray *provinces = [NSMutableArray arrayWithCapacity:dic.allKeys.count];
    for (NSString *key in dic.allKeys) {
        JKProvince *province = [[JKProvince alloc]init];
        province.name = key;
        NSArray *key_arr = [dic objectForKey:key];
        province.cities = [self getCitiesWithDic:key_arr.firstObject];
        [provinces addObject:province];
    }
    return [provinces copy];
}

- (NSArray <JKCity *> *)getCitiesWithDic:(NSDictionary *)dic {
    NSMutableArray *cities = [NSMutableArray arrayWithCapacity:dic.allKeys.count];
    for (NSString *key in dic.allKeys) {
        JKCity *city = [[JKCity alloc]init];
        city.name = key;
        city.districts = [[dic objectForKey:key] copy];
        [cities addObject:city];
    }
    return [cities copy];
}


@end
