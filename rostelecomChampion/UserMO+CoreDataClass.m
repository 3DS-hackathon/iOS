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

    
    self.email = dict[@"email"];
    self.full_name = dict[@"full_name"];
    self.balance = [dict[@"balance"] integerValue];
    self.avatar = dict[@"avatar"];
    self.phone = dict[@"phone"];
    self.raiting = [dict[@"raiting"] integerValue];
    self.role = dict[@"role"];
    self.department = [[DepartmentMO alloc] initWithDictionary:dict[@"department"]];
    self.level = [[LevelMO alloc] initWithDictionary:dict[@"level"]];
    limitTask = 10;
    limiAachievements = 10;
    NSError* error;
//    [[self managedObjectContext] save:&error];
    return self;
    
}
@end
