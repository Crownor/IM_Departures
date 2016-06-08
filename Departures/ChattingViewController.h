//
//  ChattingViewController.h
//  Departures
//
//  Created by Departures on 4/13/16.
//  Copyright © 2016 Departures. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MessageMoudel.h"
#import "MessageFrameMoudel.h"
@interface ChattingViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UIImageView *backgroundView;
@property (weak, nonatomic) IBOutlet UIView *titleView;

//+(instancetype) messageCellWithTableView:(UITableView *)tableView;
@end
