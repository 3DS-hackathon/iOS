//
//  DepartmentMO+CoreDataProperties.m
//  
//
//  Created by Данил Луговской on 24.09.16.
//
//

#import "DepartmentMO+CoreDataProperties.h"

@implementation DepartmentMO (CoreDataProperties)

//+ (NSFetchRequest<DepartmentMO *> *)fetchRequest {
//	return [[NSFetchRequest alloc] initWithEntityName:@"Department"];
//}

@dynamic avatar;
@dynamic desc;
@dynamic name;
@dynamic rating;
@dynamic users;

@end
