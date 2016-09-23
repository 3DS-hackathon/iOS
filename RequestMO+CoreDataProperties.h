//
//  RequestMO+CoreDataProperties.h
//  
//
//  Created by Данил Луговской on 24.09.16.
//
//

#import "RequestMO+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface RequestMO (CoreDataProperties)

+ (NSFetchRequest<RequestMO *> *)fetchRequest;

@property (nonatomic) int16_t delta_balance;
@property (nullable, nonatomic, copy) NSString *status;
@property (nullable, nonatomic, copy) NSString *type;
@property (nullable, nonatomic, retain) AttachmentMO *attachment;
@property (nullable, nonatomic, retain) Balance_logMO *balance;

@end

NS_ASSUME_NONNULL_END
