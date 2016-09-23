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

@interface AchievementMO : NSManagedObject

@property(strong,nonatomic) UIImage* image;

@end

NS_ASSUME_NONNULL_END

#import "AchievementMO+CoreDataProperties.h"
