//
//  JKDateMananger.h
//  Demo_02
//
//  Created by Jessica on 2018/8/14.
//  Copyright © 2018年 Milton. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JKDateMananger : NSObject

+ (NSInteger)getYeasFromYear:(NSInteger)sYear
                      toYear:(NSInteger)tYear;

+ (NSInteger)getDaysWithYear:(NSInteger)year
                       month:(NSInteger)month;

+ (NSInteger)currentYear;
+ (NSInteger)currentMonth;
+ (NSInteger)currentDay;
+ (NSInteger)currentHour;
+ (NSInteger)currentMinute;
+ (NSDate *)dateWithYear:(NSInteger)year;
+ (NSDate *)dateWithYear:(NSInteger)year month:(NSInteger)month;
+ (NSDate *)dateWithYear:(NSInteger)year month:(NSInteger)month day:(NSInteger)day;
+ (NSDate *)dateWithYear:(NSInteger)year month:(NSInteger)month day:(NSInteger)day hour:(NSInteger)hour minute:(NSInteger)minute;
+ (NSDate *)dateWithHour:(NSInteger)hour minute:(NSInteger)minute;


@end
