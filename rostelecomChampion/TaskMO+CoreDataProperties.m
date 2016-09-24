//
//  TaskMO+CoreDataProperties.m
//  
//
//  Created by Данил Луговской on 24.09.16.
//
//

#import "TaskMO+CoreDataProperties.h"

@implementation TaskMO (CoreDataProperties)

//+ (NSFetchRequest<TaskMO *> *)fetchRequest {
//	return [[NSFetchRequest alloc] initWithEntityName:@"Task"];
//}

@dynamic progress;
@dynamic progress_user;
@dynamic desc;
@dynamic name;
@dynamic total_count;
@dynamic type;
@dynamic achievement;
@dynamic balance;
@dynamic users;

@end
