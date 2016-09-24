//
//  AppServiceProvider.m
//  rostelecomChampion
//
//  Created by Данил Луговской on 24.09.16.
//  Copyright © 2016 ds. All rights reserved.
//

#import "AppServiceProvider.h"


@interface AppServiceProvider()

@property (nonatomic, strong, readwrite) ConnectionService *connectionService;
@property (nonatomic, strong, readwrite) CoreDataService *coreDataService;

@end

@implementation AppServiceProvider


+ (AppServiceProvider*)shared
{
    static dispatch_once_t pred;
    static AppServiceProvider *shared = nil;
    dispatch_once(&pred, ^{
        shared = [[super alloc] initUniqueInstance];
    });
    
    return shared;
}

- (instancetype)initUniqueInstance {
    
    self = [super init];
    
    [self setConnectionService:[[ConnectionService  alloc]init]];
    [self setCoreDataService:[[CoreDataService  alloc]init]];
    
    return self;
    
}

@end
