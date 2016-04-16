//
//  VKMarkHelper.h
//  VKMarkHelper
//
//  Created by Awhisper on 16/4/16.
//  Copyright © 2016年 Awhisper. All rights reserved.
//

#import <Foundation/Foundation.h>
#define FirstLaunchVKMark(name)\
+(void)setFirstLaunchVKMark##name;\
+(BOOL)isFirstLaunchedVKMark##name;\

#define OneDayShowOnceVKMark(name)\
+(void)setTodayShowOnceVKMark##name;\
+(BOOL)isTodayShowedOnceVKMark##name;


@interface VKMarkHelper : NSObject

@end
