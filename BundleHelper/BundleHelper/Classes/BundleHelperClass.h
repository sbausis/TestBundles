//
//  BundleHelperClass.h
//  BundleHelper
//
//  Created by Simon Pascal Baur on 20/10/14.
//  Copyright (c) 2014 Simon Pascal Baur. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AppPluginProtocol_Helper.h"

@interface BundleHelperClass : NSObject <AppPluginProtocol_Helper>

-(id)initHelperWithContext:(id)context;

@end
