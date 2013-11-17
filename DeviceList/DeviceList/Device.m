//
//  Device.m
//  DeviceList
//
//  Created by DX182-XL on 2013-11-17.
//  Copyright (c) 2013 DX182-XL. All rights reserved.
//

#import "Device.h"
#import "DeviceListClient.h"
#import "AppDelegate.h"

@implementation Device

@dynamic deviceID;
@dynamic createdAt;
@dynamic updatedAt;
@dynamic name;
@dynamic status;
@dynamic operatingSystem;
@dynamic version;

+ (void)deviceListWithBlock:(void (^)(NSError *error))block {
    [[DeviceListClient sharedClient] getPath:@"device"
       parameters:nil
          success:^(AFHTTPRequestOperation *operation, NSArray *JSONArray) {
              NSManagedObjectContext *context = [(AppDelegate *)UIApplication.sharedApplication.delegate managedObjectContext];
              [JSONArray enumerateObjectsUsingBlock:^(NSDictionary *attributes,
                                                      NSUInteger idx,
                                                      BOOL *stop)
              {
                  Device *device = [NSEntityDescription insertNewObjectForEntityForName:@"Device"
                                                                 inManagedObjectContext:context];
                  device.deviceID = attributes[@"id"];
                  device.name = attributes[@"name"];
                  device.operatingSystem = attributes[@"operatingSystem"];
                  device.version = attributes[@"version"];
              }];
              
              [context performBlock:^{
                  NSError *error;
                  [context save:&error];
                  block(error);
              }];
              
          } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
              if (block) {
                  block(error);
              }
          }];
}

@end
