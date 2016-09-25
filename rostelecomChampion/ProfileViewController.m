//
//  ProfileViewController.m
//  rostelecomChampion
//
//  Created by Данил Луговской on 24.09.16.
//  Copyright © 2016 ds. All rights reserved.
//

#import "ProfileViewController.h"
#import "AppServiceProvider.h"
#import "UserMO.h"
#import "AchievementMO.h"
#import "DepartmentMO.h"
#import "LevelMO.h"
#import "QuestTableViewCell.h"
#import "TaskMO.h"
#import "TaskRequest.h"
#import <AFNetworking/UIImageView+AFNetworking.h>
#import "YLProgressBar.h"
#import "MyQuestTableViewCell.h"
#import "AchievementTableViewCell.h"
#import "TaskViewController.h"
#import "UIColor+Hex.h"

typedef enum profileState
{
    allQuest,
    myQuest,
    achievement
} profileState;

@interface ProfileViewController (){
    UserMO* user;
    NSMutableArray* tasks;
    NSInteger limitTasks;
    NSInteger offsetTasks;
    profileState State;
    YLProgressBar* progressBar;
    NSInteger task_id;
}

@end

@implementation ProfileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //    [_questTableView reg,;isterClass:QuestTableViewCell.self forCellReuseIdentifier:@"questCell"];
    limitTasks = 15;
    tasks = [NSMutableArray new];
    _questTableView.delegate = self;
    _questTableView.dataSource = self;
    offsetTasks = 0;
    self.questTableView.rowHeight = UITableViewAutomaticDimension;
    self.questTableView.estimatedRowHeight = 100;
    progressBar = [[YLProgressBar alloc] initWithFrame:CGRectMake(0, 0, 300, 15)];
    progressBar.type               = YLProgressBarTypeFlat;
    //    progressBar.stripesOrientation = YLProgressBarStre;
    progressBar.hideStripes = YES;
    progressBar.stripesDirection   = YLProgressBarStripesDirectionLeft;
    // To allow the gradient colors to fit the progress width
    progressBar.progressStretch          = YES;
    UIColor* blueColor = [UIColor colorWithRed:45.0/255 green:135.0/255 blue:243.0/255 alpha:1];
    progressBar.trackTintColor = [UIColor colorWithRed:168.0/255 green:168.0/255 blue:168.0/255 alpha:0.27];
    NSArray *blueColors = @[blueColor,
                            blueColor];
    progressBar.progressTintColors = blueColors;
    ;
    [self.levelProgress addSubview:progressBar];
    [[self navigationController] setNavigationBarHidden:YES animated:YES];
    [_commandButton sizeToFit];
    _commandButton.titleEdgeInsets = UIEdgeInsetsMake(0, -_commandButton.imageView.frame.size.width, 0,_commandButton.imageView.frame.size.width);
    _commandButton.imageEdgeInsets = UIEdgeInsetsMake(0, _commandButton.titleLabel.frame.size.width, 0, -_commandButton.titleLabel.frame.size.width);
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [[AppServiceProvider shared].connectionService getMyUserwithBlock:^(BOOL succeded, NSMutableArray * profile) {
        if (succeded){
            user = [[UserMO alloc] initWithDictionary:profile];
            _nameLabel.text = user.full_name;
            _balanceLabel.text = [NSString stringWithFormat:@"%d ฿", user.balance];
            _commandButton.titleLabel.text = user.department.name;
            _levelNameLabel.text = user.level.name;
            _levelCountLabel.text = [NSString stringWithFormat:@"%d уровень", user.level.level];
            _levelDeltaCount.text = [NSString stringWithFormat:@"%d/%d", user.raiting, user.level.end_count];
            if (user.avatar != [NSNull null]){[_avatarImage setImageWithURL:[NSURL URLWithString:user.avatar]];}
            NSInteger delta = user.level.end_count - user.level.start_count;
            NSInteger userDelta = user.raiting - user.level.start_count;
            
            progressBar.progress = userDelta*1.0/delta;
        }
    }];
    [[AppServiceProvider shared].connectionService getAllTasksWithlimit:limitTasks offset:offsetTasks withBlock:^(BOOL succeded, NSMutableArray * array) {
        if (succeded){
            for(NSDictionary* task in array)
                [tasks addObject:[[TaskMO alloc] initWithDictionary:task]];
            [self.questTableView reloadData];
            
        }
    }];
}




/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
   
    switch (State) {
        case allQuest:
            return [tasks count];
            break;
        case myQuest:
            return [tasks count];
        case achievement:
            return [user.achivement count];
        default:
            break;
    }
    if (State == allQuest){
        return [tasks count];
    }else if (State == myQuest){
        return [user.tasks count];
    }
    return 0;
    
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    switch (State) {
        case allQuest:
            return 100;
            break;
        case myQuest:
            return 150;
            break;
        case achievement:
            return 200;
        default:
            return 100;
    }
}


- (QuestTableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell* cell;
    
    if (cell == nil) {
        
        cell = [[QuestTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"questCell"];
        
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
    }
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    TaskMO* task;
    switch (State) {
        case allQuest:{
            task = tasks[indexPath.row];
            cell = [tableView dequeueReusableCellWithIdentifier:@"questCell"];
            ((QuestTableViewCell*)cell).nameLabel.text = task.name;
            ((QuestTableViewCell*)cell).balanceLabel.text =  [NSString stringWithFormat:@"%d ฿", task.total_count];
            ((QuestTableViewCell*)cell).descLabel.text = task.desc;
            ((QuestTableViewCell*)cell).xpLabel.text =  [NSString stringWithFormat:@"%d XP", task.total_count];
            [((QuestTableViewCell*)cell).imageQuest setImageWithURL:[NSURL URLWithString:task.pic]];
            NSMutableArray *rightUtilityButtons = [NSMutableArray new];
            
            [rightUtilityButtons sw_addUtilityButtonWithColor:[UIColor greenColor] title:@"Подписаться"]
            ;
            
            ((QuestTableViewCell*)cell).rightUtilityButtons = rightUtilityButtons;
            ((QuestTableViewCell*)cell).delegate = self;
            ((QuestTableViewCell*)cell).task_id = task.id;

            break;
        }
        case myQuest:{
            
            task = user.tasks[indexPath.row];
            
            cell = [tableView dequeueReusableCellWithIdentifier:@"myQuestCell"];
            ((MyQuestTableViewCell*)cell).name.text = task.name;
            ((MyQuestTableViewCell*)cell).task_id = task.id;

            ((MyQuestTableViewCell*)cell).balance.text =  [NSString stringWithFormat:@"%d ฿", task.total_count];
            ((MyQuestTableViewCell*)cell).desc.text = task.desc;
            ((MyQuestTableViewCell*)cell).expiriernce.text =  [NSString stringWithFormat:@"%d XP", task.total_count];
            
            ((MyQuestTableViewCell*)cell).deltaCount.text = [NSString stringWithFormat:@"%d/%d",task.progress_user,task.total_count];
            ((MyQuestTableViewCell*)cell).progressBar.progress = task.progress_user*1.0/task.total_count;
            [((MyQuestTableViewCell*)cell).imageQuest setImageWithURL:[NSURL URLWithString:task.pic]];
            if (!((MyQuestTableViewCell*)cell).blur){
                UIBlurEffect *blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleDark];
                UIVisualEffectView *blurEffectView = [[UIVisualEffectView alloc] initWithEffect:blurEffect];
                blurEffectView.frame = ((MyQuestTableViewCell*)cell).imageQuest.bounds;
                blurEffectView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
                
                [((MyQuestTableViewCell*)cell).imageQuest addSubview:blurEffectView];
                ((MyQuestTableViewCell*)cell).blur = YES;
            }
            NSMutableArray *rightUtilityButtons = [NSMutableArray new];
            [rightUtilityButtons sw_addUtilityButtonWithColor:[UIColor greenColor] title:@"Добавить"]
            ;
            
            ((MyQuestTableViewCell*)cell).rightUtilityButtons = rightUtilityButtons;
            ((MyQuestTableViewCell*)cell).delegate = self;

            if ([task.status  isEqual: @"complete"]){
                ((MyQuestTableViewCell*)cell).completeView.hidden = NO;
            }else{
                ((MyQuestTableViewCell*)cell).rightUtilityButtons = rightUtilityButtons;
                ((MyQuestTableViewCell*)cell).completeView.hidden = YES;
                
            }
            break;
        }
        case achievement:{
//            [self.questTableView registerClass:[AchievementTableViewCell self] forCellReuseIdentifier:@"achievementCell"];

            AchievementMO* achieve = user.achivement[indexPath.row];
            cell = [tableView dequeueReusableCellWithIdentifier:@"achievementCell"];
            if (achieve.pic != [NSNull null]){
                [((AchievementTableViewCell*)cell).imageView setImageWithURL:[NSURL URLWithString:achieve.pic]];
            }
            UIColor* backgroundColor = [UIColor colorWithHexString:achieve.background_color];
            ((AchievementTableViewCell*)cell).backgroundColor = backgroundColor;
            ((AchievementTableViewCell*)cell).nameLabel.text = achieve.name;
            ((AchievementTableViewCell*)cell).descLabel.text = achieve.desc;
            NSDateFormatter* dateFormatter = [[NSDateFormatter alloc] init];
            dateFormatter.dateStyle = NSDateFormatterMediumStyle;
            dateFormatter.timeStyle = NSDateFormatterNoStyle;
            dateFormatter.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"ru_RU"];
            

            ((AchievementTableViewCell*)cell).timelabel.text = [dateFormatter stringFromDate:achieve.date_recieved];
            
        }
    }
    if (indexPath.row > [tasks count] - 2 && [tasks count] % limitTasks == 0){
        offsetTasks += limitTasks;
        if (State == allQuest){
            [[AppServiceProvider shared].connectionService getAllTasksWithlimit:limitTasks offset:offsetTasks withBlock:^(BOOL succeded, NSMutableArray* array) {
                if (succeded) {
                    
                    
                    for(NSDictionary* task in array)
                        [tasks addObject:[[TaskMO alloc] initWithDictionary:task]];
                    [self.questTableView reloadData];
                }
                
            }];
        }
    }
    return cell;
    
}


+ (UIColor *)colorFromHexString:(NSString *)hexString {
    unsigned rgbValue = 0;
    NSScanner *scanner = [NSScanner scannerWithString:hexString];
    [scanner setScanLocation:1]; // bypass '#' character
    [scanner scanHexInt:&rgbValue];
    return [UIColor colorWithRed:((rgbValue & 0xFF0000) >> 16)/255.0 green:((rgbValue & 0xFF00) >> 8)/255.0 blue:(rgbValue & 0xFF)/255.0 alpha:1.0];
}
             
             


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UIStoryboard* main = [UIStoryboard storyboardWithName:@"Main" bundle:nil];

    switch (State) {
        case allQuest:{
            TaskViewController *destViewController = [main instantiateViewControllerWithIdentifier:@"taskView"];
            ;
            
            destViewController.task = tasks[indexPath.row];
            [self.navigationController pushViewController:destViewController animated:YES];
            break;
        }
        case myQuest:
            break;
        default:
            break;
    }
   
    return;
    
}


- (void)swipeableTableViewCell:(SWTableViewCell *)cell didTriggerRightUtilityButtonWithIndex:(NSInteger)index {
    
    switch (State) {
        case allQuest:
            [self subscribeTask:((QuestTableViewCell*)cell).task_id];
            break;
            
        case myQuest:
            task_id = ((QuestTableViewCell*)cell).task_id;
            [self showPicker];
            break;
            
        default:
            break;
    }
}

-(void)showPicker{

    UIImagePickerController *imagePickerController = [[UIImagePickerController alloc]init];
    imagePickerController.delegate = self;
    imagePickerController.sourceType =  UIImagePickerControllerSourceTypePhotoLibrary;
    [self presentViewController:imagePickerController animated:YES completion:nil];
    
}

- (void)imagePickerController:(UIImagePickerController *)picker
        didFinishPickingImage:(UIImage *)image
                  editingInfo:(NSDictionary *)editingInfo
{
    // Dismiss the image selection, hide the picker and
    
    //show the image view with the picked image
//    RequestMO* request;
    AttachmentMO* attach = [[AttachmentMO alloc] init];
    attach.image = image;
    attach.file_name = [NSString stringWithFormat:@"%ld",(long)task_id];
    TaskRequest* task = [[TaskRequest alloc] init];
    [task.attachments addObject:attach];
    task.task_id = task_id;
    
    [task sendWithBlock:^(BOOL succeeded, NSDictionary * _Nonnull dict) {
        if (succeeded){
//            NSString* name = ((NSDictionary*)task)[@"name"];
            UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Успешно" message:[NSString stringWithFormat:@"Файл загружен "] preferredStyle:UIAlertControllerStyleAlert];
            [user.tasks addObject:[[TaskMO alloc] initWithDictionary:task]];
            
            UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                                  handler:^(UIAlertAction * action) {}];
            
            [alert addAction:defaultAction];
            [self presentViewController:alert animated:YES completion:nil];

        }
    }];
    
    [picker dismissViewControllerAnimated:YES completion:nil];
    //UIImage *newImage = image;
}
-(void)subscribeTask:(NSInteger)task_id{
    
    [[AppServiceProvider shared].connectionService subscribeTask:task_id withBlock:^(BOOL succeded, NSMutableArray *task) {
        if (succeded){
            NSString* name = ((NSDictionary*)task)[@"name"];
            UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Успешно" message:[NSString stringWithFormat:@"Вы успешно подписаны на квест %@",name] preferredStyle:UIAlertControllerStyleAlert];
            [user.tasks addObject:[[TaskMO alloc] initWithDictionary:task]];
            
            UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                                  handler:^(UIAlertAction * action) {}];
            
            [alert addAction:defaultAction];
            [self presentViewController:alert animated:YES completion:nil];
        }else{
            UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Ошибка" message:@"Попробуйте позже" preferredStyle:UIAlertControllerStyleAlert];
            
            UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                                  handler:^(UIAlertAction * action) {}];
            
            [alert addAction:defaultAction];
            [self presentViewController:alert animated:YES completion:nil];
        }
    }];
}

- (IBAction)commandButtonPress:(id)sender {
}
- (IBAction)changeSegment:(id)sender {
    
    
    switch (_segmentedControl.selectedSegmentIndex) {
        case 0:
            State = allQuest;
            break;
        case 1:
            State = myQuest;
            break;
        case 2:
            State = achievement;
            break;
        default:
            break;
    }
    [self.questTableView reloadData];
    
}
@end
