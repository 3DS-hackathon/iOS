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

@interface UserMO : NSObject

@property (nullable, nonatomic, copy) NSString *avatar;
@property (nonatomic) int16_t balance;
@property (nullable, nonatomic, copy) NSString *email;
@property (nullable, nonatomic, copy) NSString *full_name;
@property (nullable, nonatomic, copy) NSString *phone;
@property (nonatomic) int16_t raiting;
@property (nullable, nonatomic, copy) NSString *role;
@property (nullable, nonatomic, retain) NSMutableArray<AchievementMO *> *achivement;
@property (nullable, nonatomic, retain) DepartmentMO *department;
@property (nullable, nonatomic, retain) LevelMO *level;
@property (nullable, nonatomic, retain) NSMutableArray<TaskMO*> *tasks;

-(instancetype)initWithDictionary:(NSDictionary*)dict;

@end

NS_ASSUME_NONNULL_END

//#import "UserMO+CoreDataProperties.h"
