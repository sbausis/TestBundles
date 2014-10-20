//
//  AppPluginProtocol_Service.h
//  Bundle
//
//  Created by Simon Pascal Baur on 20/10/14.
//  Copyright (c) 2014 Simon Pascal Baur. All rights reserved.
//

#ifndef Bundle_AppPluginProtocol_Service_h
#define Bundle_AppPluginProtocol_Service_h

#import <Cocoa/Cocoa.h>

@protocol AppPluginProtocol_Service

-(id)initServiceWithContext:(id)context;

-(BOOL)serviceStart;
-(BOOL)serviceStop;

@end

#endif
