//
//  Balance_logMO+CoreDataClass.h
//  
//
//  Created by Данил Луговской on 24.09.16.
//
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class RequestMO, TaskMO;

NS_ASSUME_NONNULL_BEGIN

@interface Balance_logMO : NSObject

@property (nullable, nonatomic, copy) NSString *action;
@property (nonatomic) NSInteger delta_count;
@property (nullable, nonatomic, copy) NSString *desc;
@property (nullable, nonatomic, retain) RequestMO *request;
@property (nullable, nonatomic, retain) TaskMO *task;

-(instancetype)initWithDictionary:(NSDictionary*)dict;

@end

NS_ASSUME_NONNULL_END

#import "Balance_logMO+CoreDataProperties.h"
