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
#import "AppServiceProvider.h"

@implementation TaskMO

-(instancetype) initWithDictionary:(NSDictionary*)dict{
//    self = [NSEntityDescription insertNewObjectForEntityForName:@"Task" inManagedObjectContext:[[AppServiceProvider shared].coreDataService managedObjectContext]];
    

    @try {
        
        if ([NSNull null] != dict[@"progress"] ){
            self.progress = dict[@"progress"];
        }
    
    } @catch (NSException *exception) {
        
    } @finally {
        
    }
     //![[NSNull null] isEqual: dict[@"progress"]] || dict[@"progress"] != 0  ? [dict[@"progress"] intValue] : 0;
//    self.progress_user = [dict[@"progress_user"] integerValue];
    self.desc = dict[@"desc"];
    self.name = dict[@"name"];
    self.total_count = [dict[@"total_count"] integerValue];
    self.type = dict[@"type"];
    self.pic = dict[@"pic"];

    self.id = [dict[@"id"] integerValue];
    for (NSDictionary* achieve in dict[@"achievement"]){
    
        [self.achievement addObject:[[AchievementMO alloc] initWithDictionary:achieve]];
    }
    
    for (NSDictionary* user in dict[@"users"]){
        
        [self.users addObject:[[UserMO alloc] initWithDictionary:user]];
    }
    
    self.balance = [[Balance_logMO alloc]initWithDictionary:dict[@"balacne"]];
    
    return self;
}

@end
