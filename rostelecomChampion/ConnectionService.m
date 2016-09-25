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
    accessToken = [[NSUserDefaults standardUserDefaults] valueForKey:@"accessToken"];
    
    host = @"http://s3d.daniil-r.ru/";
    return self;
    
}

-(void)getTaskById:(NSInteger)id withBlock:(void (^)(BOOL, NSMutableArray *))block{
    
    NSString* query = @"api/tasks";
    NSDictionary* params = [NSDictionary dictionaryWithObjectsAndKeys:@(id), @"id",nil];
    [self sendRequestAndGetArrayWithStr:query params:params completionBlock:block];

}

-(void)login:(NSString *)email password:(NSString *)password withBlock:(void (^)(BOOL, NSDictionary*))block{
    
    NSString* query = @"api/login";
    NSDictionary* params = [NSDictionary dictionaryWithObjectsAndKeys:email,@"email", password, @"password", nil];
    [self sendPutOrDelete:@"POST" request:query withParams:params completionBlock:^(BOOL succeeded, NSDictionary* dict){
        
        [[NSUserDefaults standardUserDefaults] setObject:dict[@"token"] forKey:@"accessToken"];
        accessToken = dict[@"token"];
        block(succeeded, dict);
        
    }];
    
}


-(void)postRequest:(NSDictionary *)requestModel withBlock:(void (^)(BOOL, NSDictionary *))block{
    NSString* query = @"api/request";
    NSDictionary* params = requestModel;
    [self sendPutOrDelete:@"POST" request:query withParams:params completionBlock:block];
    
}

-(void)postAttachment:(AttachmentMO *)attachModel withBlock:(void (^)(BOOL, NSDictionary*))block{
    
    NSString* query =  [host stringByAppendingString: @"api/attach"];
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager.requestSerializer setValue:accessToken ? [@"Token " stringByAppendingString:accessToken]:@"Token" forHTTPHeaderField:@"Authorization"];

    [manager POST:query parameters:nil constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
        [formData appendPartWithFileData:UIImagePNGRepresentation(attachModel.image)
                                    name:@"file"
                                fileName:attachModel.file_name
                                mimeType:@"image/png"];
    
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        
        NSLog(@"%lld", uploadProgress.totalUnitCount);
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        block(YES, responseObject);
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        block(NO, nil);
    }];
    
}
-(void)getUserById:(NSInteger)id withBlock:(void (^)(BOOL succeded, NSMutableArray*))block{
 
    NSString* query = @"api/user";
    NSDictionary* params = [NSDictionary dictionaryWithObjectsAndKeys:@(id), @"id",nil];
    [self sendRequestAndGetArrayWithStr:query params:params completionBlock:block];
}

-(void)getMyUserwithBlock:(void (^)(BOOL, NSMutableArray *))block{

    NSString* query = [NSString stringWithFormat:@"api/user"];
   
//    NSDictionary* dict = [NSDictionary dictionaryWithObjectsAndKeys:@"https://pp.vk.me/c629503/v629503932/26eab/h9bo2IEj_jQ.jpg",@"avatar",@(140),@"balance",@"zopa",@"email",@(31),@"rating",@"вертухай",@"role",
//                          @"Луговской Данилл",@"full_name",
//  @{
//    @"avatar":@"dsa",
//    @"desc":@"zopa",
//    
//    @"name":@"gavno",
//    @(231):@"rating"
//    },@"department",
//                          @{@"end_count":@(123),
//                            @"level":@(1),
//                            @"start_count":@(0),
//                            @"name":@"YO!",
//                            },@"level",@[@{
//                                             @"name": @"zopa",
//                                             @"desc":@"gavno gavokasksd",
//                                             @"total_count":@(231),
//                                             @"progress_user":@(123),
//                                             @"pic":@"http://cs5.livemaster.ru/storage/05/e9/c631fe91acf50214394af5671fm9.jpg"
//                                             }],@"tasks",nil];
//    
//    block(YES,dict);
    [self sendRequestAndGetArrayWithStr:query params:nil completionBlock:block];

}

-(void)getAllTasksWithlimit:(NSInteger)limit offset:(NSInteger)offset withBlock:(void (^)(BOOL, NSMutableArray *))block{
    
    NSDictionary* params = [NSDictionary dictionaryWithObjectsAndKeys:@(limit),@"count", @(offset), @"offset", nil];
    NSString* query = [NSString stringWithFormat:@"api/tasks"];
    
//    NSArray* dict = @[@{
//                          @"name": @"zopa",
//                           @"desc":@"gavno gavokasksd",
//                          @"total_count":@(23123),
//                          @"pic":@"http://cs5.livemaster.ru/storage/05/e9/c631fe91acf50214394af5671fm9.jpg"
//                           }];
//    block(YES, dict);
    [self sendRequestAndGetArrayWithStr:query params:params completionBlock:block];

}

-(void)getMyDepartmentWithBlock:(void (^)(BOOL, NSMutableArray *))block{

    NSString* query = [NSString stringWithFormat:@"api/department"];
    [self sendRequestAndGetArrayWithStr:query params:nil completionBlock:block];
   
}

-(void)getDepartmentById:(NSInteger)id withBlock:(void (^)(BOOL, NSMutableArray *))block{
    
    NSString* query = @"/department";
    NSDictionary* params = [NSDictionary dictionaryWithObjectsAndKeys:@(id), @"id",nil];
    [self sendRequestAndGetArrayWithStr:query params:params completionBlock:block];
    
}


-(void)getMyTasksWithlimit:(NSInteger)limit offset:(NSInteger)offset withBlock:(void (^)(BOOL, NSMutableArray *))block{

    NSDictionary* params = [NSDictionary dictionaryWithObjectsAndKeys:@(limit),@"count", @(offset), @"offset", nil];
    NSString* query = [NSString stringWithFormat:@"api/user/tasks"];
    [self sendRequestAndGetArrayWithStr:query params:params completionBlock:block];

}

-(void)getMyAchievementsWithlimit:(NSInteger)limit offset:(NSInteger)offset withBlock:(void (^)(BOOL, NSMutableArray *))block{

    NSDictionary* params = [NSDictionary dictionaryWithObjectsAndKeys:@(limit),@"count", @(offset), @"offset", nil];
    NSString* query = [NSString stringWithFormat:@"api/user/achievements"];
    [self sendRequestAndGetArrayWithStr:query params:params completionBlock:block];
    
}


-(void)getAchievementsByUserId:(NSInteger)id limit:(NSInteger)limit offset:(NSInteger)offset withBlock:(void (^)(BOOL, NSMutableArray *))block{
    
    NSDictionary* params = [NSDictionary dictionaryWithObjectsAndKeys:@(id),@"id", @(limit),@"count", @(offset), @"offset", nil];
    NSString* query = [NSString stringWithFormat:@"api/user/achievements"];
    [self sendRequestAndGetArrayWithStr:query params:params completionBlock:block];
    
}

-(void)getUserTasksById:(NSInteger)id withlimit:(NSInteger)limit offset:(NSInteger)offset withBlock:(void (^)(BOOL, NSMutableArray *))block{

    NSDictionary* params = [NSDictionary dictionaryWithObjectsAndKeys:@(id), @"id", @(limit),@"count", @(offset), @"offset", nil];
    NSString* query = [NSString stringWithFormat:@"api/user/tasks"];
    [self sendRequestAndGetArrayWithStr:query params:params completionBlock:block];

}

-(void)getMyBalanceWithlimit:(NSInteger)limit offset:(NSInteger)offset withBlock:(void (^)(BOOL, NSMutableArray *))block{

    NSDictionary* params = [NSDictionary dictionaryWithObjectsAndKeys:@(limit),@"count", @(offset), @"offset", nil];
    NSString* query = [NSString stringWithFormat:@"api/user/log"];
    [self sendRequestAndGetArrayWithStr:query params:params completionBlock:block];

}

-(void)getUserBalanceById:(NSInteger)id withlimit:(NSInteger)limit offset:(NSInteger)offset withBlock:(void (^)(BOOL, NSMutableArray *))block{
    
    NSDictionary* params = [NSDictionary dictionaryWithObjectsAndKeys:@(id), @"id", @(limit), @"count", @(offset), @"offset", nil];
    NSString* query = [NSString stringWithFormat:@"api/user/log"];
    [self sendRequestAndGetArrayWithStr:query params:params completionBlock:block];
    
}


-(void)subscribeTask:(NSInteger)id withBlock:(void (^)(BOOL, NSMutableArray *))block{
    
    NSString* query = @"api/task";
    NSDictionary* params = @{@"id":@(id)};
    [self sendRequestAndGetArrayWithStr:query params:params completionBlock:block];
}

-(void)sendRequestAndGetArrayWithStr:(NSString*)str params:(NSDictionary*)params completionBlock:(void (^)(BOOL succeeded, NSMutableArray* array))completionBlock{
    
    NSString* string = [host stringByAppendingString:str];
    NSString *escapedPath = [string stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    
    
    
    void (^requestSuccessBlock)(NSURLSessionTask *task, id responseObject) = ^(NSURLSessionTask *task, id responseObject) {
        NSLog(@"RESPONSE: ");
        if (responseObject[@"results"]){
            completionBlock(YES,(NSDictionary*)responseObject[@"results"]);
        }else{
            completionBlock(YES,(NSDictionary*)responseObject);

        }
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
    if (accessToken){
        [manager.requestSerializer setValue:accessToken ? [@"Token " stringByAppendingString:accessToken]:@"Token" forHTTPHeaderField:@"Authorization"];
    }
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
            if (completionBlock){
                completionBlock(YES, responseObject);
            }
            
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            if (completionBlock){
                completionBlock(NO, nil);
            }
        }];
    }
    
}

@end
