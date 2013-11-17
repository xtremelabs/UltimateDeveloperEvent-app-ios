// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Device.m instead.

#import "_Device.h"

const struct DeviceAttributes DeviceAttributes = {
	.createdAt = @"createdAt",
	.deviceID = @"deviceID",
	.name = @"name",
	.operatingSystem = @"operatingSystem",
	.status = @"status",
	.updatedAt = @"updatedAt",
	.version = @"version",
};

const struct DeviceRelationships DeviceRelationships = {
};

const struct DeviceFetchedProperties DeviceFetchedProperties = {
};

@implementation DeviceID
@end

@implementation _Device

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Device" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Device";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Device" inManagedObjectContext:moc_];
}

- (DeviceID*)objectID {
	return (DeviceID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];
	
	if ([key isEqualToString:@"deviceIDValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"deviceID"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}

	return keyPaths;
}




@dynamic createdAt;






@dynamic deviceID;



- (int32_t)deviceIDValue {
	NSNumber *result = [self deviceID];
	return [result intValue];
}

- (void)setDeviceIDValue:(int32_t)value_ {
	[self setDeviceID:[NSNumber numberWithInt:value_]];
}

- (int32_t)primitiveDeviceIDValue {
	NSNumber *result = [self primitiveDeviceID];
	return [result intValue];
}

- (void)setPrimitiveDeviceIDValue:(int32_t)value_ {
	[self setPrimitiveDeviceID:[NSNumber numberWithInt:value_]];
}





@dynamic name;






@dynamic operatingSystem;






@dynamic status;






@dynamic updatedAt;






@dynamic version;











@end
