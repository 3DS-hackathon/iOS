//
//  LevelMO+CoreDataClass.m
//  
//
//  Created by Данил Луговской on 24.09.16.
//
//

#import "LevelMO.h"
#import "UserMO.h"
@implementation LevelMO

-(instancetype)initWithDictionary:(NSDictionary *)dict{
    
    self = [super init];
    self.level = [dict[@"level"] integerValue];
    self.end_count = [dict[@"end_count"]integerValue];
    self.name = dict[@"name"];
    self.start_count = [dict[@"start_count"] integerValue];
    [self addUserObject:[[UserMO alloc] initWithDictionary:dict]];
    return self;
}

@end
