//
//  Achievement+CoreDataProperties.h
//  rostelecomChampion
//
//  Created by Данил Луговской on 23.09.16.
//  Copyright © 2016 ds. All rights reserved.
//  This file was automatically generated and should not be edited.
//

#import "Achievement+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface Achievement (CoreDataProperties)

+ (NSFetchRequest<Achievement *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *name;
@property (nullable, nonatomic, copy) NSString *desc;
@property (nullable, nonatomic, copy) NSString *pic;
@property (nullable, nonatomic, retain) NSSet<Task *> *tasks;
@property (nullable, nonatomic, retain) NSSet<User *> *users;

@end

@interface Achievement (CoreDataGeneratedAccessors)

- (void)addTaskObject:(Task *)value;
- (void)removeTaskObject:(Task *)value;
- (void)addTask:(NSSet<Task *> *)values;
- (void)removeTask:(NSSet<Task *> *)values;

- (void)addUserObject:(User *)value;
- (void)removeUserObject:(User *)value;
- (void)addUser:(NSSet<User *> *)values;
- (void)removeUser:(NSSet<User *> *)values;

@end

NS_ASSUME_NONNULL_END
