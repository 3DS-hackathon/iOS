//
//  Balance_logMO+CoreDataProperties.m
//  
//
//  Created by Данил Луговской on 24.09.16.
//
//

#import "Balance_logMO+CoreDataProperties.h"

@implementation Balance_logMO (CoreDataProperties)

+ (NSFetchRequest<Balance_logMO *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"Balance_log"];
}

@dynamic action;
@dynamic delta_count;
@dynamic desc;
@dynamic request;
@dynamic task;

@end
