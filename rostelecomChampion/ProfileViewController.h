//
//  ProfileViewController.h
//  rostelecomChampion
//
//  Created by Данил Луговской on 24.09.16.
//  Copyright © 2016 ds. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <SWTableViewCell.h>
@interface ProfileViewController : UIViewController<UITableViewDelegate, UITableViewDataSource, SWTableViewCellDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *avatarImage;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UIButton *commandButton;
- (IBAction)commandButtonPress:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *balanceLabel;
@property (weak, nonatomic) IBOutlet UILabel *levelNameLabel;
@property (weak, nonatomic) IBOutlet UIView *levelProgress;
@property (weak, nonatomic) IBOutlet UILabel *levelCountLabel;
@property (weak, nonatomic) IBOutlet UILabel *levelDeltaCount;
@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentedControl;
@property (weak, nonatomic) IBOutlet UITableView *questTableView;
- (IBAction)changeSegment:(id)sender;

@end
