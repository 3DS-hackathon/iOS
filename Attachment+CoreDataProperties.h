//
//  Attachment+CoreDataProperties.h
//  rostelecomChampion
//
//  Created by Данил Луговской on 23.09.16.
//  Copyright © 2016 ds. All rights reserved.
//

#import "Attachment+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface Attachment (CoreDataProperties)

+ (NSFetchRequest<Attachment *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *file_name;
@property (nullable, nonatomic, copy) NSString *path;
@property (nullable, nonatomic, copy) NSString *mime_type;
@property (nullable, nonatomic, retain) NSSet<Request *> *request;

@end

@interface Attachment (CoreDataGeneratedAccessors)

- (void)addRequestObject:(Request *)value;
- (void)removeRequestObject:(Request *)value;
- (void)addRequest:(NSSet<Request *> *)values;
- (void)removeRequest:(NSSet<Request *> *)values;

@end

NS_ASSUME_NONNULL_END
