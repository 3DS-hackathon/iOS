//
//  TaskViewController.m
//  rostelecomChampion
//
//  Created by Данил Луговской on 25.09.16.
//  Copyright © 2016 ds. All rights reserved.
//

#import "TaskViewController.h"
#import "AppServiceProvider.h"
@interface TaskViewController ()

@end

@implementation TaskViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initTask:_task];
    [[AppServiceProvider shared].connectionService getTaskById:_task.id withBlock:^(BOOL succeded, NSMutableArray * dic) {
        TaskMO* newTask =[[TaskMO alloc] initWithDictionary:dic];
        dispatch_async(dispatch_get_main_queue(), ^{
            [self initTask:newTask];
            
        });
        _task = newTask;
        
    }];
}
-(void)viewDidAppear:(BOOL)animated{
   
}
-(void)initTask:(TaskMO*)task{
    _nameLabel.text = task.name;
    _typeLabel.text = task.type;
    _descLabel.text = task.desc;
    _balanceLabel.text = [NSString stringWithFormat:@"%d B", task.price ];
    _XPLabel.text = [NSString stringWithFormat:@"%d XP", task.expirience ];;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
