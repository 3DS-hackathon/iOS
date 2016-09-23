//
//  Request+CoreDataProperties.h
//  rostelecomChampion
//
//  Created by Данил Луговской on 23.09.16.
//  Copyright © 2016 ds. All rights reserved.
//

#import "Request+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface Request (CoreDataProperties)

+ (NSFetchRequest<Request *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *type;
@property (nullable, nonatomic, copy) NSString *status;
@property (nonatomic) int16_t delta_balance;
@property (nullable, nonatomic, retain) Attachment *attachment;
@property (nullable, nonatomic, retain) Balance_log *balance;

@end

NS_ASSUME_NONNULL_END
