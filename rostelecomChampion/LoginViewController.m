//
//  ViewController.m
//  rostelecomChampion
//
//  Created by Данил Луговской on 23.09.16.
//  Copyright © 2016 ds. All rights reserved.
//

#import "LoginViewController.h"
#import "AppServiceProvider.h"
@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)loginButtonPress:(id)sender {
    
    [[AppServiceProvider shared].connectionService login:_emailTextField.text password:_passwordTextField.text withBlock:^(BOOL succeded, NSDictionary * dict) {
        if (succeded) {
//            UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
//            UINavigationController *controller = [sb instantiateViewControllerWithIdentifier:@"navigationController"];
//            [self.navigationController pushViewController:controller animated:YES];
            [self performSegueWithIdentifier:@"login" sender:self];

        }
        
    }];
    
    
}
@end
