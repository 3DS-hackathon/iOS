//
//  Attachment+CoreDataProperties.m
//  rostelecomChampion
//
//  Created by Данил Луговской on 23.09.16.
//  Copyright © 2016 ds. All rights reserved.
//

#import "Attachment+CoreDataProperties.h"

@implementation Attachment (CoreDataProperties)

+ (NSFetchRequest<Attachment *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"Attachment"];
}

@dynamic file_name;
@dynamic path;
@dynamic mime_type;
@dynamic request;

@end
