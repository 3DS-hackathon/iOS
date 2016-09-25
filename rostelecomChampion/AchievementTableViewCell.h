//
//  AchievementTableViewCell.h
//  rostelecomChampion
//
//  Created by Данил Луговской on 25.09.16.
//  Copyright © 2016 ds. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AchievementTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *descLabel;
@property (weak, nonatomic) IBOutlet UILabel *timelabel;
//@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end
