//
//  TaskRequest.h
//  rostelecomChampion
//
//  Created by Данил Луговской on 25.09.16.
//  Copyright © 2016 ds. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AttachmentMO.h"

@interface TaskRequest : NSObject

@property NSInteger task_id;
@property (nonatomic) NSMutableArray<AttachmentMO*> * attachments;
-(void)sendWithBlock:(void (^)(BOOL, NSDictionary * _Nonnull))block;

@end
