//
//  AchievementMO+CoreDataProperties.h
//  
//
//  Created by Данил Луговской on 24.09.16.
//
//

#import "AchievementMO.h"


NS_ASSUME_NONNULL_BEGIN

@interface AchievementMO (CoreDataProperties)

+ (NSFetchRequest<AchievementMO *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *desc;
@property (nullable, nonatomic, copy) NSString *name;
@property (nullable, nonatomic, copy) NSString *pic;
@property (nullable, nonatomic, retain) NSSet<TaskMO *> *tasks;
@property (nullable, nonatomic, retain) NSSet<UserMO *> *users;

@end

@interface AchievementMO (CoreDataGeneratedAccessors)

- (void)addTasksObject:(TaskMO *)value;
- (void)removeTasksObject:(TaskMO *)value;
- (void)addTasks:(NSSet<TaskMO *> *)values;
- (void)removeTasks:(NSSet<TaskMO *> *)values;

- (void)addUsersObject:(UserMO *)value;
- (void)removeUsersObject:(UserMO *)value;
- (void)addUsers:(NSSet<UserMO *> *)values;
- (void)removeUsers:(NSSet<UserMO *> *)values;

@end

NS_ASSUME_NONNULL_END
