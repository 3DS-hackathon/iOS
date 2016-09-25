//
//  RequestMO+CoreDataClass.m
//  
//
//  Created by Данил Луговской on 24.09.16.
//
//

#import "RequestMO.h"
#import "AttachmentMO.h"
#import "Balance_logMO.h"
#import "AppServiceProvider.h"
@implementation RequestMO

-(instancetype)initWithDictionary:(NSDictionary *)dict {
    
//    self = [NSEntityDescription insertNewObjectForEntityForName:@"User" inManagedObjectContext:[[AppServiceProvider shared].coreDataService managedObjectContext]];
    self.delta_balance = [dict[@"delta_balance"] integerValue];
    self.status = dict [@"status"];
    self.type = dict [@"type"];
//    self.attachments =
    for (NSDictionary* attach in dict[@"attachments"]) {
        [_attachments addObject:[[AttachmentMO alloc] initWithDictionary:attach]];
    }
    self.task = [[TaskMO alloc] initWithDictionary:dict[@"task"]];
    self.balance = [[Balance_logMO alloc] initWithDictionary:dict[@"balance"]];
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
                                       @"type":self.type,
                                       @"task":@(self.task.id),
                                       @"attachments":attachmentsIds
                                       };
                [[AppServiceProvider shared].connectionService postRequest:dict withBlock:^(BOOL succeded, NSDictionary * dict) {
                    
                }];
                
                
            }
                
        }];
        
    }
}

//-(NSDictionary*) toDictionary{
//    
//    NSDictionary* dict = [[NSDictionary alloc] init];
//    
////    task_id 
////    [dict setValue:<#(nullable id)#> forKey:<#(nonnull NSString *)#>];
//    
//    
//}
@end
