//
//  User+CoreDataProperties.m
//  rostelecomChampion
//
//  Created by Данил Луговской on 23.09.16.
//  Copyright © 2016 ds. All rights reserved.
//

#import "User+CoreDataProperties.h"

@implementation User (CoreDataProperties)

+ (NSFetchRequest<User *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"User"];
}

@dynamic full_name;
@dynamic role;
@dynamic level;
@dynamic raiting;
@dynamic balance;
@dynamic avatar;
@dynamic email;
@dynamic phone;
@dynamic department;
@dynamic task;
@dynamic achivement;

@end
