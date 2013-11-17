#import "_Device.h"

@interface Device : _Device {}

+ (void)deviceListWithBlock:(void (^)(NSError *error))block;

@end
