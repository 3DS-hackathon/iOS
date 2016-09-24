//
//  UserMO+CoreDataClass.h
//  
//
//  Created by Данил Луговской on 24.09.16.
//
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@class AchievementMO, DepartmentMO, LevelMO, TaskMO;

NS_ASSUME_NONNULL_BEGIN

@interface UserMO : NSManagedObject

-(instancetype)initWithDictionary:(NSDictionary*)dict;

@end

NS_ASSUME_NONNULL_END

#import "UserMO+CoreDataProperties.h"
