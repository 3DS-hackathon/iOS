//
//  LevelMO+CoreDataClass.m
//  
//
//  Created by Данил Луговской on 24.09.16.
//
//

#import "LevelMO.h"
#import "UserMO.h"
#import "AppServiceProvider.h"
@implementation LevelMO

-(instancetype)initWithDictionary:(NSDictionary *)dict{
    
    self.level = [dict[@"level"] integerValue];
    self.end_count = [dict[@"end_count"]integerValue];
    self.name = dict[@"name"];
    self.start_count = [dict[@"start_count"] integerValue];
    for (NSDictionary* user in dict[@"users"]){
        [self addUserObject:[[UserMO alloc] initWithDictionary:user]];
    }
    return self;
}

@end
