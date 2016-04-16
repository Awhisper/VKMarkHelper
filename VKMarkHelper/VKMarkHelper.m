//
//  VKMarkHelper.m
//  VKMarkHelper
//
//  Created by Awhisper on 16/4/16.
//  Copyright © 2016年 Awhisper. All rights reserved.
//

#import "VKMarkHelper.h"
#import "NSDate+VKMarkHelper.h"
#import <objc/runtime.h>

@interface VKMarkHelper ()

+(BOOL)isTodayShowedOnceWithVKMark:(NSString *)mark;

+(void)setTodayShowOnceWithVKMark:(NSString *)mark;

+(void)setFirstLaunchVKMark:(NSString *)mark;

+(BOOL)isFirstLaunchVKMark:(NSString *)mark;

@end

void dynamicVKMarkSetterIMP(id self, SEL _cmd)
{
    // implementation ....
    NSString *selstr = NSStringFromSelector(_cmd);
    if ([selstr rangeOfString:@"setFirstLaunchVKMark"].location != NSNotFound) {
        NSString * name = [selstr substringFromIndex:@"setFirstLaunchVKMark".length];
        [VKMarkHelper setFirstLaunchVKMark:name];
    }
    if ([selstr rangeOfString:@"setTodayShowOnceVKMark"].location != NSNotFound) {
        NSString * name = [selstr substringFromIndex:@"setTodayShowOnceVKMark".length];
        [VKMarkHelper setTodayShowOnceWithVKMark:name];
    }
    return;
}

BOOL dynamicVKMarkBoolGetterIMP(id self, SEL _cmd)
{
    // implementation ....
    NSString *selstr = NSStringFromSelector(_cmd);
    if ([selstr rangeOfString:@"isFirstLaunchedVKMark"].location != NSNotFound) {
        NSString * name = [selstr substringFromIndex:@"isFirstLaunchedVKMark".length];
        return [VKMarkHelper isFirstLaunchVKMark:name];
    }
    if ([selstr rangeOfString:@"isTodayShowedOnceVKMark"].location != NSNotFound) {
        NSString * name = [selstr substringFromIndex:@"isTodayShowedOnceVKMark".length];
        return [VKMarkHelper isTodayShowedOnceWithVKMark:name];
    }
    return NO;
}



@implementation VKMarkHelper
#pragma mark - dynamic method
+(BOOL)resolveClassMethod:(SEL)sel
{
    NSString *selstr = NSStringFromSelector(sel);
    if ([selstr rangeOfString:@"VKMark"].location != NSNotFound) {
        Class clazz = [self class];
        Class metaClazz = object_getClass(clazz);
        
        if ([selstr rangeOfString:@"set"].location != NSNotFound) {
            class_addMethod(metaClazz, sel, (IMP) dynamicVKMarkSetterIMP, "v@:");
        }
        
        if ([selstr rangeOfString:@"is"].location != NSNotFound) {
            class_addMethod(metaClazz, sel, (IMP) dynamicVKMarkBoolGetterIMP, "b@:");
        }
        
        
        return YES;
    }else
    {
        return NO;
    }
}

#pragma mark - OneDayShowOnce
+(BOOL)isTodayShowedOnceWithVKMark:(NSString *)mark
{
    NSDate * lastCheckDate = [self oneDayShowOnceLoadLastCheckDateWithVKMark:mark];
    NSDate * thisDate = [NSDate date];
    if (lastCheckDate.day == thisDate.day) {
        return YES;
    }else
    {
        return NO;
    }
}

+(void)setTodayShowOnceWithVKMark:(NSString *)mark
{
    [self oneDayShowOnceSaveLastCheckDateWithVKMark:mark];
}

+(void)oneDayShowOnceSaveLastCheckDateWithVKMark:(NSString *)mark
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:[NSDate date] forKey:mark];
    [defaults synchronize];
}

+(NSDate *)oneDayShowOnceLoadLastCheckDateWithVKMark:(NSString *)mark
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSDate *date = [defaults objectForKey:mark];
    return date;
}

#pragma mark - FirstLaunch

+(void)setFirstLaunchVKMark:(NSString *)mark
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:mark forKey:mark];
    [defaults synchronize];
}

+(BOOL)isFirstLaunchVKMark:(NSString *)mark
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *isFirst = [defaults objectForKey:mark];
    if ([isFirst isEqualToString:mark]) {
        return YES;
    }else
    {
        return NO;
    }
}

@end
