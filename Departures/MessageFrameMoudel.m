//
//  MessageFrameMoudel.m
//  Departures
//
//  Created by Departures on 4/16/16.
//  Copyright © 2016 Departures. All rights reserved.
//

#import "MessageFrameMoudel.h"
#import "MessageMoudel.h"
//#import "Constant.h"
@implementation MessageFrameMoudel
-(void)setMessage:(MessageMoudel *)message{
    
    _message = message;
    
    CGFloat padding = 10;
    //Time
    
    if (message.hideTime == NO) {
        CGFloat timeX = 0;
        CGFloat timeY = 0;
        CGFloat timeW = SCREENWIDTH;
        CGFloat timeH = NORMALHEIGHT;
        _timeFrame = CGRectMake(timeX, timeY, timeW, timeH);
    }


    
     //头像
    CGFloat iconX  ;
//    CGFloat iconY = CGRectGetMaxY(_iconFrame) ;
    CGFloat iconY = NORMALICONHEIGHT-5;
    CGFloat iconW = NORMALICONHEIGHT;
    CGFloat iconH = NORMALICONHEIGHT;
    
    if ([message.type isEqualToNumber:[NSNumber numberWithInt:MineMessage]]) {//自己发的
        iconX = SCREENWIDTH - iconW -padding;
    }else{//别人发的
        iconX = padding;
    }
    _iconFrame = CGRectMake(iconX, iconY, iconW,iconH );

    //正文
    CGFloat textX ;
    CGFloat textY = iconY;
//    CGFloat textW = iconW;
//    CGFloat textH = iconH ;
    CGSize  textMaxSize = CGSizeMake(150, MAXFLOAT );
    CGSize textRealSize = [message.text boundingRectWithSize:textMaxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:BUTTONFONT} context:nil].size;
    CGSize buttonSize = CGSizeMake(textRealSize.width + 40, textRealSize.height + 40);
    if ([message.type isEqualToNumber:[NSNumber numberWithInt:MineMessage]]) {
        textX = SCREENWIDTH - padding - iconW - buttonSize.width;
    } else {
        textX = padding + iconW;
    }
    _textViewFrame = CGRectMake(textX , textY, buttonSize.width,buttonSize.height );

    
    //Cell高度
    CGFloat iconMaxY = CGRectGetMaxY(_iconFrame);
    CGFloat textMaxY = CGRectGetMaxY(_textViewFrame);
    _cellHeight = MAX(iconMaxY, textMaxY);
    
}
@end
