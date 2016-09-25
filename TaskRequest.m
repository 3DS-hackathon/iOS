//
//  TaskRequest.m
//  rostelecomChampion
//
//  Created by Данил Луговской on 25.09.16.
//  Copyright © 2016 ds. All rights reserved.
//

#import "TaskRequest.h"
#import "AppServiceProvider.h"
@implementation TaskRequest

-(instancetype)init{
    _attachments = [[NSMutableArray alloc] init];
    return self;
}


-(void)sendWithBlock:(void (^)(BOOL, NSDictionary * _Nonnull))block{
    
    NSMutableArray* attachmentsIds = [[NSMutableArray alloc] init];
    for(AttachmentMO* attach in _attachments){
        
        [[AppServiceProvider shared].connectionService postAttachment:attach withBlock:^(BOOL succeded, NSDictionary * dict) {
            if (succeded){
                
                [attachmentsIds addObject:dict[@"file_id"]];
                
            }
            if ([attachmentsIds count] == [_attachments count]){
                
                NSDictionary* dict = @{
                                       @"task":@(self.task_id),
                                       @"attachments":attachmentsIds
                                       };
                [[AppServiceProvider shared].connectionService postRequest:dict withBlock:^(BOOL succeded, NSDictionary * dict) {
                    
                }];
                
                
            }
            
        }];
        
    }
}

@end
