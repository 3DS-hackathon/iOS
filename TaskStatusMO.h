//
//  TaskStatusMO.h
//  rostelecomChampion
//
//  Created by Данил Луговской on 24.09.16.
//  Copyright © 2016 ds. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TaskMO.h"
@interface TaskStatusMO : NSObject

@property (nullable, nonatomic, retain) TaskMO* task;
@property (nonatomic) int16_t progress;

-(void)initWithDictionary:(NSDictionary*)dict;

@end
