//
//  Department+CoreDataProperties.h
//  rostelecomChampion
//
//  Created by Данил Луговской on 23.09.16.
//  Copyright © 2016 ds. All rights reserved.
//

#import "Department+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface Department (CoreDataProperties)

+ (NSFetchRequest<Department *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *name;
@property (nullable, nonatomic, copy) NSString *desc;
@property (nullable, nonatomic, copy) NSString *avatar;
@property (nonatomic) int16_t rating;
@property (nullable, nonatomic, retain) NSSet<User *> *users;

@end

@interface Department (CoreDataGeneratedAccessors)

- (void)addUsersObject:(User *)value;
- (void)removeUsersObject:(User *)value;
- (void)addUsers:(NSSet<User *> *)values;
- (void)removeUsers:(NSSet<User *> *)values;

@end

NS_ASSUME_NONNULL_END
