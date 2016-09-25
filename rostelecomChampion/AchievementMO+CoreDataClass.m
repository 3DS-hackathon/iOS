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
    self.background_color = dict[@"background_color"];
    self.text_color = dict[@"text_color"];
    for (NSDictionary* task in dict[@"tasks"]){
        [self.tasks addObject:[[TaskMO alloc] initWithDictionary:task]];
        
    }
    self.date_recieved = [NSDate dateWithTimeIntervalSince1970:[dict[@"date_recieved"]integerValue]];
    for (NSDictionary* user in dict[@"users"]){
        [self.users addObject:[[UserMO alloc] initWithDictionary:user]];
        
    }
    return self;
}

@end
