//
//  TaskMO+CoreDataClass.h
//  
//
//  Created by Данил Луговской on 24.09.16.
//
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class AchievementMO, Balance_logMO, UserMO;

NS_ASSUME_NONNULL_BEGIN

@interface TaskMO : NSManagedObject

-(instancetype) initWithDictionary:(NSDictionary*)dict;

@end

NS_ASSUME_NONNULL_END

#import "TaskMO+CoreDataProperties.h"
