//
//  AppServiceProvider.h
//  rostelecomChampion
//
//  Created by Данил Луговской on 24.09.16.
//  Copyright © 2016 ds. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ConnectionService.h"
#import "CoreDataService.h"
@interface AppServiceProvider : NSObject

@property (nonatomic, strong, readonly) CoreDataService *coreDataService;

@property (nonatomic, strong, readonly) ConnectionService *connectionService;
+ (AppServiceProvider *)shared;

+ (instancetype)alloc __attribute__((unavailable("alloc not available, call shared instead")));
- (instancetype)init __attribute__((unavailable("init not available, call shared instead")));
+ (instancetype)new __attribute__((unavailable("new not available, call shared instead")));
@end
