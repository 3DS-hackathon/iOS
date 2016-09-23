//
//  UserMO+CoreDataProperties.m
//  
//
//  Created by Данил Луговской on 24.09.16.
//
//

#import "UserMO+CoreDataProperties.h"

@implementation UserMO (CoreDataProperties)

+ (NSFetchRequest<UserMO *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"User"];
}

@dynamic avatar;
@dynamic balance;
@dynamic email;
@dynamic full_name;
@dynamic phone;
@dynamic raiting;
@dynamic role;
@dynamic achivement;
@dynamic department;
@dynamic level;
@dynamic tasks;

@end
