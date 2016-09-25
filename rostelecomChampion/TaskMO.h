//
//  TaskMO+CoreDataClass.h
//  
//
//  Created by Данил Луговской on 24.09.16.
//
//

#import <Foundation/Foundation.h>

@class AchievementMO, Balance_logMO, UserMO;

NS_ASSUME_NONNULL_BEGIN

@interface TaskMO : NSObject

-(instancetype) initWithDictionary:(NSDictionary*)dict;
@property (nonatomic) int16_t id;
@property (nonatomic) int16_t progress;
@property (nonatomic) int16_t progress_user;
@property (nonatomic) int16_t expirience;
@property (nonatomic) int16_t price;
@property (nullable, nonatomic, copy) NSString *desc;
@property (nullable, nonatomic, copy) NSString *pic;
@property (nullable, nonatomic, copy) NSString *name;
@property (nonatomic) int16_t total_count;
@property (nullable, nonatomic, copy) NSString *type;
@property (nullable, nonatomic, retain) NSMutableArray<AchievementMO *> *achievement;
@property (nullable, nonatomic, retain) Balance_logMO *balance;
@property (nullable, nonatomic, retain) NSMutableArray<UserMO*> *users;
@property (nullable, nonatomic, retain)  NSString* status;

@end

NS_ASSUME_NONNULL_END

