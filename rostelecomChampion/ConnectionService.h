//
//  FPConnectionService.h
//  rostelecomChampion
//
//  Created by Данил Луговской on 23.09.16.
//  Copyright © 2016 ds. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "User+CoreDataProperties.h"
#import "Request+CoreDataClass.h"
#import "Task+CoreDataProperties.h"
@interface ConnectionService : NSObject

-(void)getUserById:(NSInteger)id withBlock:(void (^)(bool succeded, User*))block;
-(void)getMyUserwithBlock:(void (^)(bool succeded, User*))block;
-(void)getTaskById:(NSInteger)id withBlock:(void (^)(bool succeded, Task*))block;
-(void)getAllTasksWithBlock:(void (^)(bool succeded, NSArray*))block;
-(void)getDepartmentById:(NSInteger)id withBlock:(void (^)(bool succeded, NSArray*))block;
-(void)getMyDepartmentWithBlock:(void (^)(bool succeded, NSArray*))block;
-(void)postRequest:(Request*)request withBlock:(void (^)(bool succeded))block;
-(void)postAttachment:(Attachment*)request withBlock:(void (^)(bool succeded))block;
-(void)login:(NSString*)email (NSString*)password withBlock:(void (^)(bool succeded))block;

@end
