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

@interface TaskMO : NSObject

-(instancetype) initWithDictionary:(NSDictionary*)dict;
@property (nonatomic) int16_t progress;
@property (nonatomic) int16_t progress_user;
@property (nullable, nonatomic, copy) NSString *desc;
@property (nullable, nonatomic, copy) NSString *name;
@property (nonatomic) int16_t total_count;
@property (nullable, nonatomic, copy) NSString *type;
@property (nullable, nonatomic, retain) NSSet<AchievementMO *> *achievement;
@property (nullable, nonatomic, retain) Balance_logMO *balance;
@property (nullable, nonatomic, retain) NSSet<UserMO*> *users;

@end

NS_ASSUME_NONNULL_END

#import "TaskMO+CoreDataProperties.h"
