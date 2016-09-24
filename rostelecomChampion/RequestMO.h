//
//  RequestMO+CoreDataClass.h
//  
//
//  Created by Данил Луговской on 24.09.16.
//
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@class AttachmentMO, Balance_logMO;

NS_ASSUME_NONNULL_BEGIN

@interface RequestMO : NSObject
@property (nonatomic) int16_t delta_balance;
@property (nullable, nonatomic, copy) NSString *status;
@property (nullable, nonatomic, copy) NSString *type;
@property (nullable, nonatomic, retain) AttachmentMO *attachment;
@property (nullable, nonatomic, retain) Balance_logMO *balance;

-(instancetype) initWithDictionary:(NSDictionary*)dict;
-(NSDictionary*)toDictionary;

@end

NS_ASSUME_NONNULL_END

#import "RequestMO+CoreDataProperties.h"
