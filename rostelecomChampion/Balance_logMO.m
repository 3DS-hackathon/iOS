//
//  Balance_logMO+CoreDataClass.m
//  
//
//  Created by Данил Луговской on 24.09.16.
//
//

#import "Balance_logMO.h"
#import "RequestMO.h"
#import "TaskMO.h"
@implementation Balance_logMO

-(instancetype)initWithDictionary:(NSDictionary *)dict{
    
    self = [super init];
    self.action = dict[@"action"];
    self.delta_count = [dict[@"delta_count"] integerValue];
    self.desc = dict[@"desc"];
    self.request = [[RequestMO alloc] initWithDictionary:dict[@"request"]];
    self.task = [[TaskMO alloc] initWithDictionary:dict[@"task"]];
    return self;
    
}

@end
