//
//  AttachmentMO+CoreDataProperties.h
//  
//
//  Created by Данил Луговской on 24.09.16.
//
//

#import "AttachmentMO.h"


NS_ASSUME_NONNULL_BEGIN

@interface AttachmentMO (CoreDataProperties)

//+ (NSFetchRequest<AttachmentMO *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *file_name;
@property (nullable, nonatomic, copy) NSString *mime_type;
@property (nullable, nonatomic, copy) NSString *path;
@property (nullable, nonatomic, retain) NSSet<RequestMO *> *request;

@end

@interface AttachmentMO (CoreDataGeneratedAccessors)

- (void)addRequestObject:(RequestMO *)value;
- (void)removeRequestObject:(RequestMO *)value;
- (void)addRequest:(NSSet<RequestMO *> *)values;
- (void)removeRequest:(NSSet<RequestMO *> *)values;

@end

NS_ASSUME_NONNULL_END
