//
//  Balance_logMO+CoreDataProperties.h
//  
//
//  Created by Данил Луговской on 24.09.16.
//
//

#import "Balance_logMO.h"


NS_ASSUME_NONNULL_BEGIN

@interface Balance_logMO (CoreDataProperties)

+ (NSFetchRequest<Balance_logMO *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *action;
@property (nullable, nonatomic, copy) NSString *delta_count;
@property (nullable, nonatomic, copy) NSString *desc;
@property (nullable, nonatomic, retain) RequestMO *request;
@property (nullable, nonatomic, retain) TaskMO *task;

@end

NS_ASSUME_NONNULL_END
