//
//  JKDateMananger.m
//  Demo_02
//
//  Created by Jessica on 2018/8/14.
//  Copyright © 2018年 Milton. All rights reserved.
//

#import "JKDateMananger.h"

static const NSCalendarUnit calendarUnit = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond | NSCalendarUnitWeekday;

@implementation JKDateMananger

+ (NSInteger)getYeasFromYear:(NSInteger)sYear toYear:(NSInteger)tYear {
    NSInteger space = tYear - sYear;
    return space;
}

//根据年、月判断日期天数
+ (NSInteger)getDaysWithYear:(NSInteger)year
                       month:(NSInteger)month{
    
    switch (month) {
        case 1:
            return 31;
            break;
        case 2:
            if (year%400==0 || (year%100!=0 && year%4 == 0)) {
                return 29;
            }else{
                return 28;
            }
            break;
        case 3:
            return 31;
            break;
        case 4:
            return 30;
            break;
        case 5:
            return 31;
            break;
        case 6:
            return 30;
            break;
        case 7:
            return 31;
            break;
        case 8:
            return 31;
            break;
        case 9:
            return 30;
            break;
        case 10:
            return 31;
            break;
        case 11:
            return 30;
            break;
        case 12:
            return 31;
            break;
        default:
            return 0;
            break;
    }
}

+ (NSInteger)currentYear {
    NSDate *date = [NSDate date];
    NSCalendar *calendar = [NSCalendar currentCalendar];
    return [calendar component:NSCalendarUnitYear fromDate:date];
}
+ (NSInteger)currentMonth {
    NSDate *date = [NSDate date];
    NSCalendar *calendar = [NSCalendar currentCalendar];
    return [calendar component:NSCalendarUnitMonth fromDate:date];
}
+ (NSInteger)currentDay {
    NSDate *date = [NSDate date];
    NSCalendar *calendar = [NSCalendar currentCalendar];
    return [calendar component:NSCalendarUnitDay fromDate:date];
}
+ (NSInteger)currentHour {
    NSDate *date = [NSDate date];
    NSCalendar *calendar = [NSCalendar currentCalendar];
    return [calendar component:NSCalendarUnitHour fromDate:date];
}
+ (NSInteger)currentMinute {
    NSDate *date = [NSDate date];
    NSCalendar *calendar = [NSCalendar currentCalendar];
    return [calendar component:NSCalendarUnitMinute fromDate:date];
}

+ (NSDate *)dateWithYear:(NSInteger)year month:(NSInteger)month day:(NSInteger)day hour:(NSInteger)hour minute:(NSInteger)minute second:(NSInteger)second {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDate *currentDate = [NSDate date];
    NSDateComponents *components = [calendar components:calendarUnit fromDate:currentDate];
    [components setYear:year];
    month ? [components setMonth:month] : [components setMonth:1];
    day ? [components setDay:day] : [components setDay:1];
    [components setHour:hour];
    [components setMinute:minute];
    [components setSecond:second];
    NSDate *date = [calendar dateFromComponents:components];
    return date;
}

+ (NSDate *)dateWithYear:(NSInteger)year {
    return [self dateWithYear:year month:1 day:0 hour:0 minute:0 second:0];
}
+ (NSDate *)dateWithYear:(NSInteger)year month:(NSInteger)month {
    return [self dateWithYear:year month:month day:0 hour:0 minute:0 second:0];
}
+ (NSDate *)dateWithYear:(NSInteger)year month:(NSInteger)month day:(NSInteger)day {
    return [self dateWithYear:year month:month day:day hour:0 minute:0 second:0];
}
+ (NSDate *)dateWithYear:(NSInteger)year month:(NSInteger)month day:(NSInteger)day hour:(NSInteger)hour minute:(NSInteger)minute {
    return [self dateWithYear:year month:month day:day hour:hour minute:minute second:0];
}
+ (NSDate *)dateWithHour:(NSInteger)hour minute:(NSInteger)minute {
    return [self dateWithYear:0 month:0 day:0 hour:hour minute:minute second:0];
}


@end
