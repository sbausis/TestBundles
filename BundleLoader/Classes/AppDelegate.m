//
//  AppDelegate.m
//  BundleLoader
//
//  Created by Simon Pascal Baur on 20/10/14.
//  Copyright (c) 2014 Simon Pascal Baur. All rights reserved.
//

#import "AppDelegate.h"
#import "AppPluginProtocol.h"

@interface AppDelegate ()

@property (weak) IBOutlet NSWindow *window;
@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    
    NSString *zStrPlugInsPath = [[NSBundle mainBundle] builtInPlugInsPath];
    NSArray *zAryBundlePaths = [NSBundle pathsForResourcesOfType:@"bundle"
                                                     inDirectory:zStrPlugInsPath];
    
    NSString * zStrPathToPlugin = [zAryBundlePaths lastObject];
    NSBundle *znsBundlePlugin = [NSBundle bundleWithPath:zStrPathToPlugin];
    
    // instantiate the principal class and call the method
    Class zPrincipalClass = [znsBundlePlugin principalClass];
    id zPrincipalClassObj = [[zPrincipalClass alloc]init];
    
    NSInteger zInt = [zPrincipalClassObj addOneInteger:100 toAnother:23];
    NSLog(@"BaseAppAppDelegate zInt = %ld",(long)zInt);	
    
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}

@end
