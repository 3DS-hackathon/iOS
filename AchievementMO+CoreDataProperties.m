//
//  AchievementMO+CoreDataProperties.m
//  
//
//  Created by Данил Луговской on 24.09.16.
//
//

#import "AchievementMO+CoreDataProperties.h"

@implementation AchievementMO (CoreDataProperties)

+ (NSFetchRequest<AchievementMO *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"Achievement"];
}

@dynamic desc;
@dynamic name;
@dynamic pic;
@dynamic tasks;
@dynamic users;

@end
