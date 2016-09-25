//
//  LevelMO+CoreDataClass.h
//  
//
//  Created by Данил Луговской on 24.09.16.
//
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class UserMO;

NS_ASSUME_NONNULL_BEGIN

@interface LevelMO : NSObject
@property (nonatomic) int16_t end_count;
@property (nonatomic) int16_t level;
@property (nullable, nonatomic, copy) NSString *name;
@property (nonatomic) int16_t start_count;
@property (nullable, nonatomic, retain)  NSMutableArray<UserMO *> *user;

@end

@interface LevelMO (CoreDataGeneratedAccessors)

- (void)addUserObject:(UserMO *)value;
- (void)removeUserObject:(UserMO *)value;
- (void)addUser:(NSSet<UserMO *> *)values;
- (void)removeUser:(NSSet<UserMO *> *)values;

-(instancetype)initWithDictionary:(NSDictionary*) dict;

@end

NS_ASSUME_NONNULL_END

#import "LevelMO+CoreDataProperties.h"
