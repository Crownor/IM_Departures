//
//  MessageTableCell.h
//  Departures
//
//  Created by Departures on 4/13/16.
//  Copyright © 2016 Departures. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MessageFrameMoudel.h"
#import "MessageMoudel.h"
#import "UIImage+ResizeImage.h"
@class MessageFrameMoudel;
@interface MessageCell : UITableViewCell
//
+ (instancetype)messageCellWithTableView:(UITableView *)tableview;
//frame的模型
@property(nonatomic,strong) MessageFrameMoudel *messageFrame;
////时间
//@property (nonatomic, weak)UILabel *time;
////正文
//@property (nonatomic, weak)UIButton *textView;
////用户头像
//@property (nonatomic, weak)UIImageView *icon;
//
//
//
@end
