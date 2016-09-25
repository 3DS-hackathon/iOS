//
//  UserMO+CoreDataClass.m
//
//
//  Created by Данил Луговской on 24.09.16.
//
//

#import "UserMO.h"
#import "AchievementMO.h"
#import "DepartmentMO.h"
#import "LevelMO.h"
#import "TaskMO.h"
#import "AppServiceProvider.h"
@interface UserMO(){
    NSInteger limitTask;
    
    NSInteger offsetTask;
    NSInteger limiAachievements;
    NSInteger offsetAchievements;
    
}
@end

@implementation UserMO

-(instancetype)initWithDictionary:(NSDictionary*)dict{
    
    //    self = [NSEntityDescription insertNewObjectForEntityForName:@"User" inManagedObjectContext:[[AppServiceProvider shared].coreDataService managedObjectContext]];
    
    self.achivement = [NSMutableArray new];
    self.tasks = [NSMutableArray new];
    self.email = dict[@"email"];
    self.full_name = dict[@"full_name"];
    self.balance = [dict[@"balance"] integerValue];
    self.avatar = dict[@"avatar"];
    self.phone = dict[@"phone"];
    self.raiting = [dict[@"rating"] integerValue];
    self.role = dict[@"role"];
    self.department = dict[@"department"] != [NSNull null] ?  [[DepartmentMO alloc] initWithDictionary:dict[@"department"]] : nil;
    self.level = [[LevelMO alloc] initWithDictionary:dict[@"level"]];
    if (dict[@"achivement"]){
        for (NSDictionary* diction in dict[@"achivement"]){
            [self.achivement addObject:[[AchievementMO alloc] initWithDictionary:diction]];
        }
    }
    if (dict[@"tasks"]){
//        NSMutableArray* dicts = dict[@"tasks"];
        for (NSDictionary* diction in dict[@"tasks"]){
            [self.tasks addObject:[[TaskMO alloc] initWithDictionary:diction]];
        }
    }
    limitTask = 10;
    limiAachievements = 10;
    NSError* error;
    //    [[self managedObjectContext] save:&error];
    return self;
    
}
@end
