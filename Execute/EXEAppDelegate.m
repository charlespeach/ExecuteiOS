//
//  EXEAppDelegate.m
//  Execute
//
//  Created by Charles Peach on 2/02/14.
//  Copyright (c) 2014 cub3y. All rights reserved.
//

#import "EXEAppDelegate.h"
#import "EXEListViewController.h"

@implementation EXEAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    
//    UIScreen *screen = [UIScreen mainScreen];
//    CGRect frame = [screen bounds];
//    self.window = [[UIWindow alloc] initWithFrame:frame];
    
    // short hand way to do the above
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    self.window.backgroundColor = [UIColor whiteColor];
    
    UIViewController *viewController = [[EXEListViewController alloc] init];
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:viewController];
    
    self.window.rootViewController = navigationController;
    
    [self.window makeKeyAndVisible];
    return YES;
}

@end
