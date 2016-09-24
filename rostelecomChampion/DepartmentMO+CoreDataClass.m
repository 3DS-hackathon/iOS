//
//  DepartmentMO+CoreDataClass.m
//  
//
//  Created by Данил Луговской on 24.09.16.
//
//

#import "DepartmentMO.h"
#import "UserMO.h"
@implementation DepartmentMO

-(instancetype)initWithDictionary:(NSDictionary *)dict{
    self = [super init];
    self.avatar = dict[@"avatar"];
    self.desc = dict[@"desc"];
    self.name = dict[@"name"];
    self.rating = [dict[@"ratin"] integerValue];
    for (NSDictionary* user in dict[@"users"]){
        [self addUsersObject:[[UserMO alloc] initWithDictionary:user]];
    }
    return self;
}

@end
