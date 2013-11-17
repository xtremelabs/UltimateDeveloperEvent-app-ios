// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Device.h instead.

#import <CoreData/CoreData.h>


extern const struct DeviceAttributes {
	__unsafe_unretained NSString *createdAt;
	__unsafe_unretained NSString *deviceID;
	__unsafe_unretained NSString *name;
	__unsafe_unretained NSString *operatingSystem;
	__unsafe_unretained NSString *status;
	__unsafe_unretained NSString *updatedAt;
	__unsafe_unretained NSString *version;
} DeviceAttributes;

extern const struct DeviceRelationships {
} DeviceRelationships;

extern const struct DeviceFetchedProperties {
} DeviceFetchedProperties;










@interface DeviceID : NSManagedObjectID {}
@end

@interface _Device : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (DeviceID*)objectID;





@property (nonatomic, strong) NSDate* createdAt;



//- (BOOL)validateCreatedAt:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* deviceID;



@property int32_t deviceIDValue;
- (int32_t)deviceIDValue;
- (void)setDeviceIDValue:(int32_t)value_;

//- (BOOL)validateDeviceID:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* name;



//- (BOOL)validateName:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* operatingSystem;



//- (BOOL)validateOperatingSystem:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* status;



//- (BOOL)validateStatus:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSDate* updatedAt;



//- (BOOL)validateUpdatedAt:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* version;



//- (BOOL)validateVersion:(id*)value_ error:(NSError**)error_;






@end

@interface _Device (CoreDataGeneratedAccessors)

@end

@interface _Device (CoreDataGeneratedPrimitiveAccessors)


- (NSDate*)primitiveCreatedAt;
- (void)setPrimitiveCreatedAt:(NSDate*)value;




- (NSNumber*)primitiveDeviceID;
- (void)setPrimitiveDeviceID:(NSNumber*)value;

- (int32_t)primitiveDeviceIDValue;
- (void)setPrimitiveDeviceIDValue:(int32_t)value_;




- (NSString*)primitiveName;
- (void)setPrimitiveName:(NSString*)value;




- (NSString*)primitiveOperatingSystem;
- (void)setPrimitiveOperatingSystem:(NSString*)value;




- (NSString*)primitiveStatus;
- (void)setPrimitiveStatus:(NSString*)value;




- (NSDate*)primitiveUpdatedAt;
- (void)setPrimitiveUpdatedAt:(NSDate*)value;




- (NSString*)primitiveVersion;
- (void)setPrimitiveVersion:(NSString*)value;




@end
