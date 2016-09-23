//
//  FPConnectionService.h
//  rostelecomChampion
//
//  Created by Данил Луговской on 23.09.16.
//  Copyright © 2016 ds. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RequestMO.h"
#import "AttachmentMO.h"
@class UserMO,TaskMO,RequestMO,AttachmentMO;
@interface ConnectionService : NSObject

-(void)getUserById:(NSInteger)id withBlock:(void (^)(bool succeded, NSMutableArray*))block;
-(void)getMyUserwithBlock:(void (^)(bool succeded, NSMutableArray*))block;
-(void)getTaskById:(NSInteger)id withBlock:(void (^)(bool succeded, NSMutableArray*))block;
-(void)getAllTasksWithlimit:(NSInteger)limit offset:(NSInteger)offset withBlock:(void (^)(bool succeded, NSMutableArray*))block;
-(void)getDepartmentById:(NSInteger)id withBlock:(void (^)(bool succeded, NSMutableArray*))block;
-(void)getMyDepartmentWithBlock:(void (^)(bool succeded, NSMutableArray*))block;
-(void)postRequest:(RequestMO*)requestModel withBlock:(void (^)(bool succeded, NSDictionary*))block;
-(void)postAttachment:(AttachmentMO*)attachModel withBlock:(void (^)(bool succeded))block;
-(void)login:(NSString*)email password:(NSString*)password withBlock:(void (^)(bool succeded, NSDictionary*))block;
-(void)getAchievementsByUserId:(NSInteger)id limit:(NSInteger)limit offset:(NSInteger)offset withBlock:(void (^)(bool succeded, NSMutableArray*))block;
-(void)getMyAchievementsWithlimit:(NSInteger)limit offset:(NSInteger)offset withBlock:(void (^)(bool succeded, NSMutableArray*))block;
-(void)getMyBalanceWithlimit:(NSInteger)limit offset:(NSInteger)offset withBlock:(void (^)(bool succeded, NSMutableArray*))block;
-(void)getUserBalanceById:(NSInteger)id withlimit:(NSInteger)limit offset:(NSInteger)offset withBlock:(void (^)(bool succeded, NSMutableArray*))block;
-(void)getMyTasksWithlimit:(NSInteger)limit offset:(NSInteger)offset withBlock:(void (^)(bool succeded, NSMutableArray*))block;
-(void)getUserTasksById:(NSInteger)id withlimit:(NSInteger)limit offset:(NSInteger)offset withBlock:(void (^)(bool succeded, NSMutableArray*))block;

@end
