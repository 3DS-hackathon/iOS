//
//  AchievementMO+CoreDataClass.h
//  
//
//  Created by Данил Луговской on 24.09.16.
//
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@class TaskMO, UserMO;

NS_ASSUME_NONNULL_BEGIN

@interface AchievementMO : NSObject

-(instancetype)initWithDictionary:(NSDictionary*)dict;

@property (nullable, nonatomic, copy) NSString *desc;
@property (nullable, nonatomic, copy) NSString *name;
@property (nullable, nonatomic, copy) NSString *pic;
@property (nullable, nonatomic, retain) NSSet<TaskMO *> *tasks;
@property (nullable, nonatomic, retain) NSSet<UserMO *> *users;


@end

NS_ASSUME_NONNULL_END

#import "AchievementMO+CoreDataProperties.h"
