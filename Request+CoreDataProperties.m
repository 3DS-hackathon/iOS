//
//  Request+CoreDataProperties.m
//  rostelecomChampion
//
//  Created by Данил Луговской on 23.09.16.
//  Copyright © 2016 ds. All rights reserved.
//

#import "Request+CoreDataProperties.h"

@implementation Request (CoreDataProperties)

+ (NSFetchRequest<Request *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"Request"];
}

@dynamic type;
@dynamic status;
@dynamic delta_balance;
@dynamic attachment;
@dynamic balance;

@end
