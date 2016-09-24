//
//  AttachmentMO+CoreDataProperties.m
//  
//
//  Created by Данил Луговской on 24.09.16.
//
//

#import "AttachmentMO+CoreDataProperties.h"

@implementation AttachmentMO (CoreDataProperties)
//
//+ (NSFetchRequest<AttachmentMO *> *)fetchRequest {
//	return [[NSFetchRequest alloc] initWithEntityName:@"Attachment"];
//}

@dynamic file_name;
@dynamic mime_type;
@dynamic path;
@dynamic request;

@end
