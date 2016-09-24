//
//  DepartmentMO+CoreDataProperties.h
//  
//
//  Created by Данил Луговской on 24.09.16.
//
//

#import "DepartmentMO.h"


NS_ASSUME_NONNULL_BEGIN

@interface DepartmentMO (CoreDataProperties)

//+ (NSFetchRequest<DepartmentMO *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *avatar;
@property (nullable, nonatomic, copy) NSString *desc;
@property (nullable, nonatomic, copy) NSString *name;
@property (nonatomic) int16_t rating;
@property (nullable, nonatomic, retain) NSSet<UserMO *> *users;

@end

@interface DepartmentMO (CoreDataGeneratedAccessors)

- (void)addUsersObject:(UserMO *)value;
- (void)removeUsersObject:(UserMO *)value;
- (void)addUsers:(NSSet<UserMO *> *)values;
- (void)removeUsers:(NSSet<UserMO *> *)values;

@end

NS_ASSUME_NONNULL_END
