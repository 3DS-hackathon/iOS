//
//  Balance_log+CoreDataProperties.h
//  rostelecomChampion
//
//  Created by Данил Луговской on 23.09.16.
//  Copyright © 2016 ds. All rights reserved.
//

#import "Balance_log+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface Balance_log (CoreDataProperties)

+ (NSFetchRequest<Balance_log *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *action;
@property (nullable, nonatomic, copy) NSString *desc;
@property (nullable, nonatomic, copy) NSString *delta_count;
@property (nullable, nonatomic, retain) Task *task;
@property (nullable, nonatomic, retain) Request *request;

@end

NS_ASSUME_NONNULL_END
