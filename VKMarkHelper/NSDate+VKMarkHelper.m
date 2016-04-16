//
//  NSDate+VKMarkHelper.m
//  VKMarkHelper
//
//  Created by Awhisper on 16/4/16.
//  Copyright © 2016年 Awhisper. All rights reserved.
//

#import "NSDate+VKMarkHelper.h"

#define DATE_COMPONENTS (NSCalendarUnitYear| NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitWeekOfYear |  NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond | NSCalendarUnitWeekday | NSCalendarUnitWeekdayOrdinal)

#define CURRENT_CALENDAR [NSCalendar currentCalendar]

@implementation NSDate (VKMarkHelper)

- (NSInteger) day
{
    NSDateComponents *components = [CURRENT_CALENDAR components:DATE_COMPONENTS fromDate:self];
    return [components day];
}

@end
