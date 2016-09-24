//
//  AttachmentMO+CoreDataClass.h
//  
//
//  Created by Данил Луговской on 24.09.16.
//
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@class RequestMO;

NS_ASSUME_NONNULL_BEGIN

@interface AttachmentMO : NSObject

@property (nonatomic) UIImage* image;

-(instancetype)initWithDictionary:(NSDictionary*) dict;
@property (nullable, nonatomic, copy) NSString *file_name;
@property (nullable, nonatomic, copy) NSString *mime_type;
@property (nullable, nonatomic, copy) NSString *path;
@property (nullable, nonatomic, retain) NSSet<RequestMO *> *request;

@end

NS_ASSUME_NONNULL_END

#import "AttachmentMO+CoreDataProperties.h"
