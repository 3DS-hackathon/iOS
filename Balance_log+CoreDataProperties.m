//
//  Balance_log+CoreDataProperties.m
//  rostelecomChampion
//
//  Created by Данил Луговской on 23.09.16.
//  Copyright © 2016 ds. All rights reserved.
//

#import "Balance_log+CoreDataProperties.h"

@implementation Balance_log (CoreDataProperties)

+ (NSFetchRequest<Balance_log *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"Balance_log"];
}

@dynamic action;
@dynamic desc;
@dynamic delta_count;
@dynamic task;
@dynamic request;

@end
