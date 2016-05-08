//
//  LoginViewController.h
//  Departures
//
//  Created by Departures on 3/21/16.
//  Copyright © 2016 Departures. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
@interface LoginViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIView *LoginView;
@property (weak, nonatomic) IBOutlet UITextField *accountTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordField;
@property (weak, nonatomic) IBOutlet UIButton *loginButton;
- (IBAction)loginButtonDidPress:(id)sender;
@end
