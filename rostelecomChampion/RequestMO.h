//
//  RequestMO+CoreDataClass.h
//  
//
//  Created by Данил Луговской on 24.09.16.
//
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
#import "TaskMO.h"
@class AttachmentMO, Balance_logMO;

NS_ASSUME_NONNULL_BEGIN

@interface RequestMO : NSObject
@property (nonatomic) int16_t delta_balance;
@property (nullable, nonatomic, copy) NSString *status;
@property (nullable, nonatomic, copy) NSString *type;
@property (nullable, nonatomic, retain) TaskMO* task;
@property (nullable, nonatomic, retain) NSMutableArray<AttachmentMO*> *attachments;
@property (nullable, nonatomic, retain) Balance_logMO *balance;

-(instancetype) initWithDictionary:(NSDictionary*)dict;
-(void)sendWithBlock:(void (^)(BOOL, NSDictionary *))block;
@end

NS_ASSUME_NONNULL_END

#import "RequestMO+CoreDataProperties.h"
