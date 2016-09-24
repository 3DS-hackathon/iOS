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
#import "DepartmentMO.h"
#import "LevelMO.h"
#import "QuestTableViewCell.h"
#import "TaskMO.h"
#import <AFNetworking/UIImageView+AFNetworking.h>

@interface ProfileViewController (){
    UserMO* user;
    NSMutableArray* tasks;
    NSInteger limitTasks;
    NSInteger offsetTasks;
}

@end

@implementation ProfileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [_questTableView registerClass:[QuestTableViewCell class] forCellReuseIdentifier:@"questCell"];
    limitTasks = 15;
    offsetTasks = 0;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [[AppServiceProvider shared].connectionService getMyUserwithBlock:^(bool succeded, NSMutableArray * profile) {
        if (succeded){
            user = [[UserMO alloc] initWithDictionary:profile];
            _nameLabel.text = user.full_name;
            _balanceLabel.text = [NSString stringWithFormat:@"%d ฿", user.balance];
            _commandButton.titleLabel.text = user.department.name;
            _levelNameLabel.text = user.level.name;
            _levelCountLabel.text = [NSString stringWithFormat:@"%d уровень", user.level.level];
            _levelDeltaCount.text = [NSString stringWithFormat:@"%d/%d", user.level.start_count, user.level.end_count];
            [_avatarImage setImageWithURL:[NSURL URLWithString:user.avatar]];
        }
    }];
    tasks = [NSMutableArray new];
    [[AppServiceProvider shared].connectionService getAllTasksWithlimit:limitTasks offset:offsetTasks withBlock:^(bool succeded, NSMutableArray * array) {
        if (succeded){
            for(NSDictionary* task in array)
                [tasks addObject:[[TaskMO alloc] initWithDictionary:task]];
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
    if (user){
        return [tasks count];
    }else{
        return 0;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    QuestTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"questCell"];
    if (cell == nil) {
        
        cell = [[QuestTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"questCell"];
        
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
    }
    
    TaskMO* task = tasks[indexPath.row];
    cell.nameLabel.text = task.name;
    cell.balanceLabel.text =  [NSString stringWithFormat:@"%d ฿", task.total_count];
    cell.descLabel.text = task.desc;
    cell.xpLabel.text =  [NSString stringWithFormat:@"%d XP", task.total_count];
    if (indexPath.row > [tasks count] - 2 && [tasks count] % offsetTasks == 0){
        offsetTasks += limitTasks;
        [[AppServiceProvider shared].connectionService getAllTasksWithlimit:limitTasks offset:offsetTasks withBlock:^(bool succeded, NSMutableArray* array) {
            if (succeded) {
                
                
                for(NSDictionary* task in array)
                    [tasks addObject:[[TaskMO alloc] initWithDictionary:task]];
            }
        }];
    }
    return cell;
    
}


- (IBAction)commandButtonPress:(id)sender {
}
- (IBAction)changeSegment:(id)sender {
    
}
@end
