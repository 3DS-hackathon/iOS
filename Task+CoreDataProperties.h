//
//  Task+CoreDataProperties.h
//  rostelecomChampion
//
//  Created by Данил Луговской on 23.09.16.
//  Copyright © 2016 ds. All rights reserved.
//  This file was automatically generated and should not be edited.
//

#import "Task.h"


NS_ASSUME_NONNULL_BEGIN

@interface Task (CoreDataProperties)

+ (NSFetchRequest<Task *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *name;
@property (nullable, nonatomic, copy) NSString *desc;
@property (nullable, nonatomic, copy) NSString *type;
@property (nonatomic) int16_t current_count;
@property (nonatomic) int16_t total_count;
@property (nullable, nonatomic, retain) User *users;
@property (nullable, nonatomic, retain) Balance_log *balance;
@property (nullable, nonatomic, retain) NSSet<Achievement *> *achievement;

@end

@interface Task (CoreDataGeneratedAccessors)

- (void)addAchievementObject:(Achievement *)value;
- (void)removeAchievementObject:(Achievement *)value;
- (void)addAchievement:(NSSet<Achievement *> *)values;
- (void)removeAchievement:(NSSet<Achievement *> *)values;

@end

NS_ASSUME_NONNULL_END
