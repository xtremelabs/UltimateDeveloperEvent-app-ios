#import "Device.h"
#import "DeviceListClient.h"
#import "AppDelegate.h"


@interface Device ()

// Private interface goes here.

@end


@implementation Device

+ (void)deviceListWithBlock:(void (^)(NSError *error))block {
    [[DeviceListClient sharedClient] getPath:@"device"
                                  parameters:nil
                                     success:^(AFHTTPRequestOperation *operation, NSArray *JSONArray) {
                                         NSManagedObjectContext *context = [(AppDelegate *)UIApplication.sharedApplication.delegate managedObjectContext];
                                         [JSONArray enumerateObjectsUsingBlock:^(NSDictionary *attributes,
                                                                                 NSUInteger idx,
                                                                                 BOOL *stop)
                                          {
                                              Device *device = [NSEntityDescription insertNewObjectForEntityForName:Device.entityName
                                                                                             inManagedObjectContext:context];
                                              device.deviceID = attributes[@"id"];
                                              device.name = attributes[DeviceAttributes.name];
                                              device.operatingSystem = attributes[DeviceAttributes.operatingSystem];
                                              device.version = attributes[DeviceAttributes.version];
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

+ (void)deleteDevice:(Device *)device withBlock:(void (^)(NSError *error))block {
    [[DeviceListClient sharedClient] deletePath:[NSString stringWithFormat:@"%@/%@", @"device", device.deviceID]
    parameters:nil
    success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSManagedObjectContext *context = [(AppDelegate *)UIApplication.sharedApplication.delegate managedObjectContext];
        [context performBlock:^{
            NSError *error;
            [context deleteObject:device];
            [context save:&error];
            if (block) {
                block(error);
            }
        }];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if (block) {
            block(error);
        }
    }];
}

@end
