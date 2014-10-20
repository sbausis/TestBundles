//
//  BundleClass.m
//  Bundle
//
//  Created by Simon Pascal Baur on 20/10/14.
//  Copyright (c) 2014 Simon Pascal Baur. All rights reserved.
//

#import "BundleClass.h"

@implementation BundleClass

- (NSInteger)addOneInteger:(NSInteger)pInt1 toAnother:(NSInteger)pInt2 {
    NSLog(@"%s", __FUNCTION__);
    NSInteger zIntResult = pInt1 + pInt2;
    return zIntResult;
}

@end
