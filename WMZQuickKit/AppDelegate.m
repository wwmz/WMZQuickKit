//
//  AppDelegate.m
//  WMZQuickKit
//
//  Created by wmz on 2020/11/18.
//  Copyright © 2020 wmz. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window.rootViewController = [ViewController new];
    [self.window makeKeyAndVisible];
    
    return YES;
}



@end
