//
//  AttachmentMO+CoreDataClass.m
//  
//
//  Created by Данил Луговской on 24.09.16.
//
//

#import "AttachmentMO.h"
#import "RequestMO.h"
#import "AppServiceProvider.h"
@implementation AttachmentMO

-(instancetype)initWithDictionary:(NSDictionary *)dict{
    
//    self = [NSEntityDescription insertNewObjectForEntityForName:@"Attachment" inManagedObjectContext:[[AppServiceProvider shared].coreDataService managedObjectContext]];
    
    self.file_name = dict[@"file_name"];
    self.mime_type = dict[@"mime_type"];
    self.path = dict [@"path"];
    for (NSDictionary* req in dict[@"request"]){
        
        [self addRequestObject:[[RequestMO alloc] initWithDictionary:req]];

    }
    return self;
}

@dynamic image;

@end
