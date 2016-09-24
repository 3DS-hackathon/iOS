//
//  TaskMO+CoreDataClass.m
//  
//
//  Created by Данил Луговской on 24.09.16.
//
//

#import "TaskMO.h"
#import "AchievementMO.h"
#import "Balance_logMO.h"
#import "UserMO.h"
@implementation TaskMO

-(instancetype) initWithDictionary:(NSDictionary*)dict{
    self = [super init];
    self.progress = [dict[@"progress"] integerValue];
    self.progress_user = [dict[@"progress_user"] integerValue];
    self.desc = dict[@"desc"];
    self.name = dict[@"name"];
    self.total_count = [dict[@"total_count"] integerValue];
    self.type = dict[@"type"];
    for (NSDictionary* achieve in dict[@"achievement"]){
    
        [self addAchievementObject:[[AchievementMO alloc] initWithDictionary:achieve]];
    }
    
    for (NSDictionary* user in dict[@"users"]){
        
        [self addUserObject:[[UserMO alloc] initWithDictionary:user]];
    }
    
    self.balance = [[Balance_logMO alloc]initWithDictionary:dict[@"balacne"]];
    
    return self;
}

@end
