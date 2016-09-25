//
//  TaskStatusMO.m
//  rostelecomChampion
//
//  Created by Данил Луговской on 24.09.16.
//  Copyright © 2016 ds. All rights reserved.
//

#import "TaskStatusMO.h"

@implementation TaskStatusMO

-(void)initWithDictionary:(NSDictionary *)dict{
    self.progress = [dict[@"progress"] integerValue];
//    self.task = [[TaskMO alloc] int]
}

@end
