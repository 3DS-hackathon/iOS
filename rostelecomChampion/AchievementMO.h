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
@property (nullable, nonatomic, copy) NSString *background_color;
@property (nullable, nonatomic, copy) NSString *text_color;
@property (nullable, nonatomic, copy) NSDate *date_recieved;

@property (nullable, nonatomic, retain) NSMutableArray<TaskMO *> *tasks;
@property (nullable, nonatomic, retain) NSMutableArray<UserMO *> *users;


@end

NS_ASSUME_NONNULL_END

