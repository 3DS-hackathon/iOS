//
//  Achievement+CoreDataProperties.m
//  rostelecomChampion
//
//  Created by Данил Луговской on 23.09.16.
//  Copyright © 2016 ds. All rights reserved.
//  This file was automatically generated and should not be edited.
//

#import "Achievement+CoreDataProperties.h"

@implementation Achievement (CoreDataProperties)

+ (NSFetchRequest<Achievement *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"Achievement"];
}

@dynamic name;
@dynamic desc;
@dynamic pic;
@dynamic task;
@dynamic user;

@end
