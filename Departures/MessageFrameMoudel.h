//
//  MessageFrameMoudel.h
//  Departures
//
//  Created by Departures on 4/16/16.
//  Copyright © 2016 Departures. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CGGeometry.h>
#import <UIkit/UIkit.h>
#import "Constant.h"
@class MessageMoudel;

@interface MessageFrameMoudel : NSObject

//Frame of time
@property (nonatomic , assign , readonly) CGRect timeFrame;
//Frame of textView
@property (nonatomic , assign , readonly) CGRect textViewFrame;
//Frame of icon
@property (nonatomic , assign , readonly) CGRect iconFrame;
//Cell
@property (nonatomic , assign , readonly ) float cellHeight;
//数据模型
@property (nonatomic , strong) MessageMoudel *message;
@end


