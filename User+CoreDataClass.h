//
//  User+CoreDataClass.h
//  rostelecomChampion
//
//  Created by Данил Луговской on 23.09.16.
//  Copyright © 2016 ds. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Achievement, Department, Task;

NS_ASSUME_NONNULL_BEGIN

@interface User : NSManagedObject

@end

NS_ASSUME_NONNULL_END

#import "User+CoreDataProperties.h"
