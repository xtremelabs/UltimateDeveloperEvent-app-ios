//
//  DeviceListIncrementalStore.m
//  DeviceList
//
//  Created by DX182-XL on 2013-11-18.
//  Copyright (c) 2013 DX182-XL. All rights reserved.
//

#import "DeviceListIncrementalStore.h"
#import "DeviceListClient.h"

@implementation DeviceListIncrementalStore

+ (void)initialize {
    [NSPersistentStoreCoordinator registerStoreClass:self forStoreType:[self type]];
}

+ (NSString *)type {
    return NSStringFromClass(self);
}

+ (NSManagedObjectModel *)model {
        return [[NSManagedObjectModel alloc] initWithContentsOfURL:[[NSBundle mainBundle] URLForResource:@"DeviceList" withExtension:@"xcdatamodeld"]];
}

- (id <AFIncrementalStoreHTTPClient>)HTTPClient {
    return [DeviceListClient sharedClient];
}

@end
