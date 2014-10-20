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

-(NSArray*)getPlugins {
    
    NSMutableArray* newPlugins = [[NSMutableArray alloc] init];
    
    NSString *pluginPath = [[NSBundle mainBundle] builtInPlugInsPath];
    if (pluginPath) {
        NSLog(@"pluginPath : %@", pluginPath);
        
        NSArray* extensions = [NSArray arrayWithObjects:@"bundle", @"plugin", @"framework", nil];
        for (NSString* ext in extensions) {
            NSLog(@"extension : %@", ext);
            
            NSArray *bundlesArray = [NSBundle pathsForResourcesOfType:ext inDirectory:pluginPath];
            NSLog(@"bundlesArray : %@", bundlesArray);
            
            for (NSString* bundlePath in bundlesArray) {
                NSLog(@"bundlePath : %@", bundlePath);
                
                NSBundle *bundle = [NSBundle bundleWithPath:bundlePath];
                NSLog(@"bundle : %@", bundle);
                
                NSLog(@"bundleClass description : %@", [[bundle principalClass] description]);
                
                Class bundleClass = [bundle principalClass];
                NSLog(@"bundleClass : %@", bundleClass);
                
                [newPlugins addObject:bundleClass];
            }
        }
    }
    
    return [NSArray arrayWithArray:newPlugins];
}
-(void)initPlugins {
    
    NSArray* classes = [self getPlugins];
    for (Class pluginClass in classes) {
        
        id pluginInstance = [[pluginClass alloc] init];
        NSLog(@"bundleInstance : %@", pluginInstance);
        
        if ([pluginInstance conformsToProtocol:@protocol(AppPluginProtocol_Service)]) {
            NSLog(@"conformsToProtocol : %@", @protocol(AppPluginProtocol_Service));
            id<AppPluginProtocol_Service> serviceInstance = (id<AppPluginProtocol_Service>)pluginInstance;
            serviceInstance = [serviceInstance initServiceWithContext:self];
        }
        else if ([pluginInstance conformsToProtocol:@protocol(AppPluginProtocol_Helper)]) {
            NSLog(@"conformsToProtocol : %@", @protocol(AppPluginProtocol_Helper));
            id<AppPluginProtocol_Helper> helperInstance = (id<AppPluginProtocol_Helper>)pluginInstance;
            helperInstance = [helperInstance initHelperWithContext:self];
            
        }
        else if ([pluginInstance conformsToProtocol:@protocol(AppPluginProtocol)]) {
            NSLog(@"conformsToProtocol : %@", @protocol(AppPluginProtocol));
            id<AppPluginProtocol> bundleInstance = (id<AppPluginProtocol>)pluginInstance;
            NSInteger zInt = [bundleInstance addOneInteger:100 toAnother:23];
            NSLog(@"zInt : %ld",(long)zInt);
            
        }
        
    }
    
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    
    [self initPlugins];
    
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    NSLog(@"%s", __FUNCTION__);
    
}

-(BOOL)applicationShouldTerminateAfterLastWindowClosed:(NSApplication *)sender {
    return TRUE;
}

@end
