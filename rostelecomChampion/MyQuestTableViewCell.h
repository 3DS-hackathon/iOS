//
//  MyQuestTableViewCell.h
//  rostelecomChampion
//
//  Created by Данил Луговской on 24.09.16.
//  Copyright © 2016 ds. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YLProgressBar.h"
#import <SWTableViewCell.h>
@interface MyQuestTableViewCell : SWTableViewCell
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *desc;
@property (weak, nonatomic) IBOutlet UILabel *deltaCount;
@property (weak, nonatomic) IBOutlet UIView *progressView;
@property (weak, nonatomic) IBOutlet UILabel *balance;
@property (weak, nonatomic) IBOutlet UILabel *expiriernce;
@property (weak, nonatomic) IBOutlet UIView *completeView;
@property ( nonatomic) IBOutlet YLProgressBar *progressBar;
@property (weak, nonatomic) IBOutlet UIImageView *imageQuest;
@property BOOL blur;
@property NSInteger task_id;
@end
