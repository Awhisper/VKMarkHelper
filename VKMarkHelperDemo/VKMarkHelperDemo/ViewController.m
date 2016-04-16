//
//  ViewController.m
//  VKMarkHelper
//
//  Created by Awhisper on 16/4/16.
//  Copyright © 2016年 Awhisper. All rights reserved.
//

#import "ViewController.h"
#import "VKMarkHelper+demo.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    BOOL launch = [VKMarkHelper isFirstLaunchedVKMarkgogogo];
    [VKMarkHelper setFirstLaunchVKMarkgogogo];
    launch = [VKMarkHelper isFirstLaunchedVKMarkgogogo];
    
    BOOL todayshow = [VKMarkHelper isTodayShowedOnceVKMarklololo];
    [VKMarkHelper setTodayShowOnceVKMarklololo];
    todayshow = [VKMarkHelper isTodayShowedOnceVKMarklololo];
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
