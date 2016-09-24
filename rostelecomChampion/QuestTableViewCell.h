//
//  QuestTableViewCell.h
//  rostelecomChampion
//
//  Created by Данил Луговской on 24.09.16.
//  Copyright © 2016 ds. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QuestTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *balanceLabel;
@property (weak, nonatomic) IBOutlet UILabel *xpLabel;
@property (weak, nonatomic) IBOutlet UILabel *descLabel;

@end
