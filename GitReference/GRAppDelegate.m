//
//  GRAppDelegate.m
//  GitReference
//
//  Created by Joshua Howland on 5/12/14.
//  Copyright (c) 2014 DevMountain. All rights reserved.
//

#import "GRAppDelegate.h"
#import "GitReferenceViewController.h"

@implementation GRAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    self.window.backgroundColor = [UIColor whiteColor];
    
    [self.window makeKeyAndVisible];
    
    // Instance of My Viewcontorller
    GitReferenceViewController  *viewController = [ GitReferenceViewController new];
    
    //setiing my Window as Rootviewcontroller 
    self.window.rootViewController = viewController;
    
    return YES;
}

@end
