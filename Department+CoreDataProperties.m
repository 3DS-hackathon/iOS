//
//  Department+CoreDataProperties.m
//  rostelecomChampion
//
//  Created by Данил Луговской on 23.09.16.
//  Copyright © 2016 ds. All rights reserved.
//

#import "Department+CoreDataProperties.h"

@implementation Department (CoreDataProperties)

+ (NSFetchRequest<Department *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"Department"];
}

@dynamic name;
@dynamic desc;
@dynamic avatar;
@dynamic rating;
@dynamic users;

@end
