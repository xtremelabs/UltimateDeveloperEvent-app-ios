//
//  DeviceListClient.h
//  DeviceList
//
//  Created by DX182-XL on 2013-11-17.
//  Copyright (c) 2013 DX182-XL. All rights reserved.
//

#import "AFHTTPClient.h"

@interface DeviceListClient : AFHTTPClient

+ (instancetype)sharedClient;

@end
