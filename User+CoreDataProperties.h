//
//  User+CoreDataProperties.h
//  rostelecomChampion
//
//  Created by Данил Луговской on 23.09.16.
//  Copyright © 2016 ds. All rights reserved.
//

#import "User+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface User (CoreDataProperties)

+ (NSFetchRequest<User *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *full_name;
@property (nullable, nonatomic, copy) NSString *role;
@property (nonatomic) int16_t level;
@property (nonatomic) int16_t raiting;
@property (nonatomic) int16_t balance;
@property (nullable, nonatomic, copy) NSString *avatar;
@property (nullable, nonatomic, copy) NSString *email;
@property (nullable, nonatomic, copy) NSString *phone;
@property (nullable, nonatomic, retain) Department *department;
@property (nullable, nonatomic, retain) Task *task;
@property (nullable, nonatomic, retain) NSSet<Achievement *> *achivement;

@end

@interface User (CoreDataGeneratedAccessors)

- (void)addAchivementObject:(Achievement *)value;
- (void)removeAchivementObject:(Achievement *)value;
- (void)addAchivement:(NSSet<Achievement *> *)values;
- (void)removeAchivement:(NSSet<Achievement *> *)values;

@end

NS_ASSUME_NONNULL_END
