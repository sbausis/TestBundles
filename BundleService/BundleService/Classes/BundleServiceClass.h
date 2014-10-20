//
//  BundleServiceClass.h
//  BundleService
//
//  Created by Simon Pascal Baur on 20/10/14.
//  Copyright (c) 2014 Simon Pascal Baur. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AppPluginProtocol_Service.h"

@interface BundleServiceClass : NSObject <AppPluginProtocol_Service>

-(id)initServiceWithContext:(id)context;

-(BOOL)serviceStart;
-(BOOL)serviceStop;

@end
