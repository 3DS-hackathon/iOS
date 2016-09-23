//
//  TaskMO+CoreDataProperties.h
//  
//
//  Created by Данил Луговской on 24.09.16.
//
//

#import "TaskMO.h"


NS_ASSUME_NONNULL_BEGIN

@interface TaskMO (CoreDataProperties)

+ (NSFetchRequest<TaskMO *> *)fetchRequest;

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

@interface TaskMO (CoreDataGeneratedAccessors)

- (void)addAchievementObject:(AchievementMO *)value;
- (void)removeAchievementObject:(AchievementMO *)value;
- (void)addAchievement:(NSSet<AchievementMO *> *)values;
- (void)removeAchievement:(NSSet<AchievementMO *> *)values;

@end

NS_ASSUME_NONNULL_END
