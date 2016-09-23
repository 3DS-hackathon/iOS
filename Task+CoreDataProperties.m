//
//  Task+CoreDataProperties.m
//  rostelecomChampion
//
//  Created by Данил Луговской on 23.09.16.
//  Copyright © 2016 ds. All rights reserved.
//  This file was automatically generated and should not be edited.
//

#import "Task+CoreDataProperties.h"

@implementation Task (CoreDataProperties)

+ (NSFetchRequest<Task *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"Task"];
}

@dynamic name;
@dynamic desc;
@dynamic type;
@dynamic current_count;
@dynamic total_count;
@dynamic users;
@dynamic balance;
@dynamic achievement;

@end
