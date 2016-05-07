//
//  AccountViewController.m
//  Departures
//
//  Created by Departures on 3/26/16.
//  Copyright © 2016 Departures. All rights reserved.
//

#import "AccountViewController.h"

@implementation AccountViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //将Status更改为白色
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent animated:NO];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (IBAction)quickButtonDidPress:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];

}
@end
