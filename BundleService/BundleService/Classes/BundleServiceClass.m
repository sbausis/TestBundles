//
//  BundleServiceClass.m
//  BundleService
//
//  Created by Simon Pascal Baur on 20/10/14.
//  Copyright (c) 2014 Simon Pascal Baur. All rights reserved.
//

#import "BundleServiceClass.h"

@implementation BundleServiceClass

-(id)initServiceWithContext:(id)context {
    NSLog(@"%s", __FUNCTION__);
    self = [super init];
    if (self) {
        
    }
    return self;
}

-(BOOL)serviceStart {
    NSLog(@"%s", __FUNCTION__);
    return TRUE;
}
-(BOOL)serviceStop {
    NSLog(@"%s", __FUNCTION__);
    return TRUE;
}

@end
