//
//  AppDelegate.m
//  BundleLoader
//
//  Created by Simon Pascal Baur on 20/10/14.
//  Copyright (c) 2014 Simon Pascal Baur. All rights reserved.
//

#import "AppDelegate.h"
#import "AppPluginProtocol.h"
#import "AppPluginProtocol_Helper.h"
#import "AppPluginProtocol_Service.h"

@interface AppDelegate ()

@property (weak) IBOutlet NSWindow *window;
@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    NSLog(@"%s", __FUNCTION__);
    
    NSString *pluginPath = [[NSBundle mainBundle] builtInPlugInsPath];
    NSLog(@"pluginPath : %@", pluginPath);
    
    NSArray *bundlesArray = [NSBundle pathsForResourcesOfType:@"bundle" inDirectory:pluginPath];
    NSLog(@"bundlesArray : %@", bundlesArray);
    
    NSString * lastBundle = [bundlesArray lastObject];
    NSLog(@"lastBundle : %@", lastBundle);
    
    NSBundle *bundle = [NSBundle bundleWithPath:lastBundle];
    NSLog(@"bundle : %@", bundle);
    
    NSLog(@"bundleClass description : %@", [[bundle principalClass] description]);
    Class bundleClass = [bundle principalClass];
    NSLog(@"bundleClass : %@", bundleClass);
    
    id bundleInstance = [[bundleClass alloc] init];
    NSLog(@"bundleInstance : %@", bundleInstance);
    
    NSInteger zInt = [bundleInstance addOneInteger:100 toAnother:23];
    NSLog(@"zInt : %ld",(long)zInt);
    
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    NSLog(@"%s", __FUNCTION__);
    
}

@end
