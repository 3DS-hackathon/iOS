//
//  FPConnectionService.m
//  rostelecomChampion
//
//  Created by Данил Луговской on 23.09.16.
//  Copyright © 2016 ds. All rights reserved.
//

#import "ConnectionService.h"
#import <AFNetworking.h>

@interface ConnectionService (){
    
    NSString* host;
    NSString* accessToken;
}

@end

@implementation ConnectionService

-(instancetype)init{
    self = [super init];
    
    host = @"";
    return self;
    
}

-(void)getTaskById:(NSInteger)id withBlock:(void (^)(bool, NSMutableArray *))block{
    
    NSString* query = @"/tasks";
    NSDictionary* params = [NSDictionary dictionaryWithObjectsAndKeys:@(id), @"id",nil];
    [self sendRequestAndGetArrayWithStr:query params:params completionBlock:block];

}

-(void)login:(NSString *)email password:(NSString *)password withBlock:(void (^)(bool, NSDictionary*))block{
    
    NSString* query = @"/login";
    NSDictionary* params = [NSDictionary dictionaryWithObjectsAndKeys:@"email",email, @"password", password, nil];
    [self sendPutOrDelete:@"POST" request:query withParams:params completionBlock:block];
    
}


-(void)postRequest:(RequestMO *)requestModel withBlock:(void (^)(bool, NSDictionary *))block{
    NSString* query = @"/request";
    NSDictionary* params = [requestModel toDictionary];
    [self sendPutOrDelete:@"POST" request:query withParams:params completionBlock:block];
    
}

-(void)postAttachment:(AttachmentMO *)attachModel withBlock:(void (^)(bool))block{
    
    NSString* query = @"/attach";
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    [manager POST:query parameters:nil constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
        [formData appendPartWithFileData:UIImagePNGRepresentation(attachModel.image)
                                    name:@"file"
                                fileName:attachModel.file_name mimeType:@"image/png"];
    
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        block(YES);
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        block(NO);
    }];
    
}
-(void)getUserById:(NSInteger)id withBlock:(void (^)(bool succeded, NSMutableArray*))block{
 
    NSString* query = @"/user";
    NSDictionary* params = [NSDictionary dictionaryWithObjectsAndKeys:@(id), @"id",nil];
    [self sendRequestAndGetArrayWithStr:query params:params completionBlock:block];
}

-(void)getMyUserwithBlock:(void (^)(bool, NSMutableArray *))block{

    NSString* query = [NSString stringWithFormat:@"/user"];
   
    NSDictionary* dict = [NSDictionary dictionaryWithObjectsAndKeys:@"https://pp.vk.me/c629503/v629503932/26eab/h9bo2IEj_jQ.jpg",@"avatar",@(140),@"balance",@"zopa",@"email",@(31),@"rating",@"вертухай",@"role",
                          @"Луговской Данилл",@"full_name",
  @{
    @"avatar":@"dsa",
    @"desc":@"zopa",
    
    @"name":@"gavno",
    @(231):@"rating"
    },@"department",
                          @{@"end_count":@(123),
                            @"level":@(1),
                            @"start_count":@(0),
                            @"name":@"YO!",
    },@"level",nil];
    
    block(YES,dict);
//    [self sendRequestAndGetArrayWithStr:query params:nil completionBlock:block];

}

-(void)getAllTasksWithlimit:(NSInteger)limit offset:(NSInteger)offset withBlock:(void (^)(bool, NSMutableArray *))block{
    
    NSDictionary* params = [NSDictionary dictionaryWithObjectsAndKeys:@(limit),@"count", @(offset), @"offset", nil];
    NSString* query = [NSString stringWithFormat:@"/tasks"];
    
    NSArray* dict = @[@{
                          @"name": @"zopa",
                           @"desc":@"gavno gavokasksd",
                          @"total_count":@(23123)
                           }];
    block(YES,dict);
    [self sendRequestAndGetArrayWithStr:query params:params completionBlock:block];

}

-(void)getMyDepartmentWithBlock:(void (^)(bool, NSMutableArray *))block{

    NSString* query = [NSString stringWithFormat:@"/department"];
    [self sendRequestAndGetArrayWithStr:query params:nil completionBlock:block];
   
}

-(void)getDepartmentById:(NSInteger)id withBlock:(void (^)(bool, NSMutableArray *))block{
    
    NSString* query = @"/department";
    NSDictionary* params = [NSDictionary dictionaryWithObjectsAndKeys:@(id), @"id",nil];
    [self sendRequestAndGetArrayWithStr:query params:params completionBlock:block];
    
}


-(void)getMyTasksWithlimit:(NSInteger)limit offset:(NSInteger)offset withBlock:(void (^)(bool, NSMutableArray *))block{

    NSDictionary* params = [NSDictionary dictionaryWithObjectsAndKeys:@(limit),@"count", @(offset), @"offset", nil];
    NSString* query = [NSString stringWithFormat:@"/user/tasks"];
    [self sendRequestAndGetArrayWithStr:query params:params completionBlock:block];

}

-(void)getMyAchievementsWithlimit:(NSInteger)limit offset:(NSInteger)offset withBlock:(void (^)(bool, NSMutableArray *))block{

    NSDictionary* params = [NSDictionary dictionaryWithObjectsAndKeys:@(limit),@"count", @(offset), @"offset", nil];
    NSString* query = [NSString stringWithFormat:@"/user/achievements"];
    [self sendRequestAndGetArrayWithStr:query params:params completionBlock:block];
    
}


-(void)getAchievementsByUserId:(NSInteger)id limit:(NSInteger)limit offset:(NSInteger)offset withBlock:(void (^)(bool, NSMutableArray *))block{
    
    NSDictionary* params = [NSDictionary dictionaryWithObjectsAndKeys:@(id),@"id", @(limit),@"count", @(offset), @"offset", nil];
    NSString* query = [NSString stringWithFormat:@"/user/achievements"];
    [self sendRequestAndGetArrayWithStr:query params:params completionBlock:block];
    
}

-(void)getUserTasksById:(NSInteger)id withlimit:(NSInteger)limit offset:(NSInteger)offset withBlock:(void (^)(bool, NSMutableArray *))block{

    NSDictionary* params = [NSDictionary dictionaryWithObjectsAndKeys:@(id), @"id", @(limit),@"count", @(offset), @"offset", nil];
    NSString* query = [NSString stringWithFormat:@"/user/tasks"];
    [self sendRequestAndGetArrayWithStr:query params:params completionBlock:block];

}

-(void)getMyBalanceWithlimit:(NSInteger)limit offset:(NSInteger)offset withBlock:(void (^)(bool, NSMutableArray *))block{

    NSDictionary* params = [NSDictionary dictionaryWithObjectsAndKeys:@(limit),@"count", @(offset), @"offset", nil];
    NSString* query = [NSString stringWithFormat:@"/user/log"];
    [self sendRequestAndGetArrayWithStr:query params:params completionBlock:block];

}

-(void)getUserBalanceById:(NSInteger)id withlimit:(NSInteger)limit offset:(NSInteger)offset withBlock:(void (^)(bool, NSMutableArray *))block{
    
    NSDictionary* params = [NSDictionary dictionaryWithObjectsAndKeys:@(id), @"id", @(limit), @"count", @(offset), @"offset", nil];
    NSString* query = [NSString stringWithFormat:@"/user/log"];
    [self sendRequestAndGetArrayWithStr:query params:params completionBlock:block];
    
}



-(void)sendRequestAndGetArrayWithStr:(NSString*)str params:(NSDictionary*)params completionBlock:(void (^)(BOOL succeeded, NSMutableArray* array))completionBlock{
    
    NSString* string = [host stringByAppendingString:str];
    NSString *escapedPath = [string stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    
    
    
    void (^requestSuccessBlock)(NSURLSessionTask *task, id responseObject) = ^(NSURLSessionTask *task, id responseObject) {
        NSLog(@"RESPONSE: ");
        completionBlock(YES,(NSMutableArray*)responseObject);
    };
    
    
    void (^requestFailureBlock)(NSURLSessionTask *operation, NSError *error) = ^(NSURLSessionTask *operation, NSError *error) {
        
        NSLog(@"%@", error);
        completionBlock(NO,nil);
        
    };
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager.requestSerializer setValue:accessToken ? [@"Token " stringByAppendingString:accessToken]:@"Token" forHTTPHeaderField:@"Authorization"];
    [manager.requestSerializer setCachePolicy:NSURLRequestUseProtocolCachePolicy];
    
    [manager GET:escapedPath parameters:params progress:nil success:requestSuccessBlock failure:requestFailureBlock];
    
    AFHTTPResponseSerializer *respSerializer = [AFHTTPResponseSerializer serializer];
    
    NSMutableIndexSet *responseCodes = [NSMutableIndexSet indexSet];
    [responseCodes addIndex:304];
    respSerializer.acceptableStatusCodes = responseCodes;
    
    
    
    
}



-(void)sendPutOrDelete :(NSString*)method request:(NSString*)requestStr withParams:(NSDictionary*)params completionBlock:(void (^)(BOOL succeeded, NSDictionary* dict))completionBlock{
    
    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc] initWithBaseURL:[NSURL URLWithString:host]];
    NSString *escapedPath = [requestStr stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    [manager setRequestSerializer:[AFJSONRequestSerializer serializer]];
    
    [manager.requestSerializer setValue:accessToken ? [@"Token " stringByAppendingString:accessToken]:@"Token" forHTTPHeaderField:@"Authorization"];
    
    if ([method isEqualToString:@"PUT"]) {
        [manager PUT:requestStr parameters:params success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
            if(completionBlock)
                completionBlock(YES,nil);
            
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            if(completionBlock)
                completionBlock(NO,nil);
            
        }];
    }
    if ([method isEqualToString:@"DELETE"]) {
        [manager DELETE:requestStr parameters:params success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
            if(completionBlock)
                completionBlock(YES,nil);
            
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            if(completionBlock)
                completionBlock(NO,nil);
            
        }];
    }
    if ( [method isEqualToString:@"POST"]){
        [manager POST:escapedPath parameters:params progress:^(NSProgress * _Nonnull uploadProgress) {
            
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            
        }];
    }
    
}

@end
