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

@interface AttachmentMO : NSManagedObject
@property (nonatomic) UIImage* image;
@end

NS_ASSUME_NONNULL_END

#import "AttachmentMO+CoreDataProperties.h"
