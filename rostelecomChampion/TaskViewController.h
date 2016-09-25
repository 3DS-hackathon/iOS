//
//  TaskViewController.h
//  rostelecomChampion
//
//  Created by Данил Луговской on 25.09.16.
//  Copyright © 2016 ds. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TaskMO.h"
@interface TaskViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIImageView *taskImageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *typeLabel;
@property (weak, nonatomic) IBOutlet UILabel *descLabel;
@property (weak, nonatomic) IBOutlet UILabel *balanceLabel;
@property (weak, nonatomic) IBOutlet UILabel *XPLabel;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property TaskMO* task;

@end
