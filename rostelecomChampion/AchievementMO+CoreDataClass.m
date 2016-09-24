//
//  AchievementMO+CoreDataClass.m
//  
//
//  Created by Данил Луговской on 24.09.16.
//
//

#import "AchievementMO.h"
#import "TaskMO.h"
#import "UserMO.h"
@implementation AchievementMO

-(instancetype)initWithDictionary:(NSDictionary *)dict{
    
    self = [super init];
    self.desc = dict[@"desc"];
    self.name = dict[@"name"];
    self.pic = dict[@"pic"];
    for (NSDictionary* task in dict[@"tasks"]){
        [self addTasksObject:[[TaskMO alloc] initWithDictionary:task]];
        
    }
    for (NSDictionary* user in dict[@"users"]){
        [self addUsersObject:[[UserMO alloc] initWithDictionary:user]];
        
    }
    return self;
}

@end
