#import "_Device.h"

@interface Device : _Device {}

+ (void)deviceListWithBlock:(void (^)(NSError *error))block;

+ (void)deleteDevice:(Device *)device withBlock:(void (^)(NSError *error))block;

+ (void)modifyDevice:(Device *)device withBlock:(void (^)(NSError *error))block;

+ (void)insertDevice:(Device *)device withBlock:(void (^)(NSError *error))block;

@end
