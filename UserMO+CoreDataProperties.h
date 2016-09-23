//
//  UserMO+CoreDataProperties.h
//  
//
//  Created by Данил Луговской on 24.09.16.
//
//

#import "UserMO+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface UserMO (CoreDataProperties)

+ (NSFetchRequest<UserMO *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *avatar;
@property (nonatomic) int16_t balance;
@property (nullable, nonatomic, copy) NSString *email;
@property (nullable, nonatomic, copy) NSString *full_name;
@property (nullable, nonatomic, copy) NSString *phone;
@property (nonatomic) int16_t raiting;
@property (nullable, nonatomic, copy) NSString *role;
@property (nullable, nonatomic, retain) NSSet<AchievementMO *> *achivement;
@property (nullable, nonatomic, retain) DepartmentMO *department;
@property (nullable, nonatomic, retain) LevelMO *level;
@property (nullable, nonatomic, retain) NSSet<TaskMO*> *tasks;

@end

@interface UserMO (CoreDataGeneratedAccessors)

- (void)addAchivementObject:(AchievementMO *)value;
- (void)removeAchivementObject:(AchievementMO *)value;
- (void)addAchivement:(NSSet<AchievementMO *> *)values;
- (void)removeAchivement:(NSSet<AchievementMO *> *)values;

@end

NS_ASSUME_NONNULL_END
