//
//  RequestMO+CoreDataClass.h
//  
//
//  Created by Данил Луговской on 24.09.16.
//
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@class AttachmentMO, Balance_logMO;

NS_ASSUME_NONNULL_BEGIN

@interface RequestMO : NSManagedObject


-(NSDictionary*)toDictionary;

@end

NS_ASSUME_NONNULL_END

#import "RequestMO+CoreDataProperties.h"
