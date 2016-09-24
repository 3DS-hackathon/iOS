//
//  CoreDataService.h
//  rostelecomChampion
//
//  Created by Данил Луговской on 24.09.16.
//  Copyright © 2016 ds. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
@interface CoreDataService : NSObject


@property (strong) NSManagedObjectContext *managedObjectContext;

- (void)initializeCoreData;

@end
