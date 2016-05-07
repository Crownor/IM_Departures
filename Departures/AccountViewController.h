//
//  AccountViewController.h
//  Departures
//
//  Created by Departures on 3/26/16.
//  Copyright © 2016 Departures. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface AccountViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIButton *quitButton;
@property (weak, nonatomic) IBOutlet UILabel *titleLable;
@property (weak, nonatomic) IBOutlet UIView *mainView;

- (IBAction)quickButtonDidPress:(id)sender;
@end
