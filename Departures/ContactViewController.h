//
//  ContactViewController.h
//  Departures
//
//  Created by Departures on 3/24/16.
//  Copyright © 2016 Departures. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AccountViewController.h"
#import "WBPopMenuModel.h"
#import "WBPopMenuSingleton.h"
@interface ContactViewController : UIViewController
- (IBAction)moreButtonDidPress:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *accountButton;
- (IBAction)accountButtonDidPress:(id)sender;
@end
