//
//  MyQuestTableViewCell.m
//  rostelecomChampion
//
//  Created by Данил Луговской on 24.09.16.
//  Copyright © 2016 ds. All rights reserved.
//

#import "MyQuestTableViewCell.h"

@implementation MyQuestTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    _progressBar = [[YLProgressBar alloc] initWithFrame:CGRectMake(0, 0, 250  , 15)];
    _progressBar.type               = YLProgressBarTypeFlat;
    //    progressBar.stripesOrientation = YLProgressBarStre;
    _progressBar.hideStripes = YES;
    _progressBar.stripesDirection   = YLProgressBarStripesDirectionLeft;
    // To allow the gradient colors to fit the progress width
    _progressBar.progressStretch          = YES;
    UIColor* blueColor = [UIColor colorWithRed:45.0/255 green:135.0/255 blue:243.0/255 alpha:1];
    _progressBar.trackTintColor = [UIColor colorWithRed:168.0/255 green:168.0/255 blue:168.0/255 alpha:0.27];
    NSArray *blueColors = @[blueColor,
                            blueColor];
    _progressBar.progressTintColors = blueColors;
    ;
    [self.progressView addSubview:_progressBar];

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
