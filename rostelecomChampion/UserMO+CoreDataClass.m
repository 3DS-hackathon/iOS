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

@interface UserMO(){
    NSInteger limitTask;
    NSInteger offsetTask;
    NSInteger limiAachievements;
    NSInteger offsetAchievements;
    
}
@end

@implementation UserMO

-(instancetype)initWithDictionary:(NSDictionary*)dict{
    self = [super init];
    self.email = dict[@"email"];
    limitTask = 10;
    limiAachievements = 10;
    return self;
    
}
@end
