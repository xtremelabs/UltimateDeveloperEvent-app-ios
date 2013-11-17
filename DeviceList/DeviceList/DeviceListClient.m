//
//  DeviceListClient.m
//  DeviceList
//
//  Created by DX182-XL on 2013-11-17.
//  Copyright (c) 2013 DX182-XL. All rights reserved.
//

#import "DeviceListClient.h"
#import "AFJSONRequestOperation.h"

static NSString *const kDeviceListBaseURLString = @"http://localhost:7000/";

@implementation DeviceListClient

+ (instancetype)sharedClient {
    static DeviceListClient *_sharedClient = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedClient = [[DeviceListClient alloc]
                         initWithBaseURL:[NSURL URLWithString:kDeviceListBaseURLString]];
    });
    
    return _sharedClient;
}

- (id)initWithBaseURL:(NSURL *)url {
    self = [super initWithBaseURL:url];
    if (!self) {
        return nil;
    }
    
    [self registerHTTPOperationClass:[AFJSONRequestOperation class]];
    [self setDefaultHeader:@"Accept" value:@"application/json"];
    
    return self;
}

@end
