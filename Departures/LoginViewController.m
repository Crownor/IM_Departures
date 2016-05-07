//
//  LoginViewController.m
//  Departures
//
//  Created by Departures on 3/21/16.
//  Copyright © 2016 Departures. All rights reserved.
//
//#define bounceOut 14
#import "LoginViewController.h"
#import <QuartzCore/QuartzCore.h>


@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //将status转化为白色
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent animated:NO];
    //转化textField的文字颜色,但是效果不是很好
//    self.accountTextField.placeholder = @"Account";
//    [self.accountTextField setValue:[UIColor colorWithRed:125 green:133 blue:145 alpha:80] forKeyPath:@"_placeholderLabel.textColor"];

    
    
    
    

}

- (IBAction)loginButtonDidPress:(id)sender {
    
    if ([self.accountTextField.text isEqualToString:@"admin"]
        &&
        [self.passwordField.text isEqualToString:@"admin"]) {
        NSLog(@"登陆成功");
        [self performSegueWithIdentifier:@"LoginToChatViewController" sender:self];
        
    } else {
        //测试用
        [self performSegueWithIdentifier:@"LoginToChatViewController" sender:self];

        NSLog(@"error");
    }
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
