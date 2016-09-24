//
//  RequestMO+CoreDataClass.m
//  
//
//  Created by Данил Луговской on 24.09.16.
//
//

#import "RequestMO.h"
#import "AttachmentMO.h"
#import "Balance_logMO.h"
@implementation RequestMO

-(instancetype)initWithDictionary:(NSDictionary *)dict {
    
    self = [super init];
    self.delta_balance = [dict[@"delta_balance"] integerValue];
    self.status = dict [@"status"];
    self.type = dict [@"type"];
    self.attachment = [[AttachmentMO alloc] initWithDictionary:dict[@"attachment"]];
    self.balance = [[Balance_logMO alloc] initWithDictionary:dict[@"balance"]];
    return self;
}

@end
