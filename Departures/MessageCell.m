//
//  MessageTableCell.m
//  Departures
//
//  Created by Departures on 4/13/16.
//  Copyright © 2016 Departures. All rights reserved.
//

#import "MessageCell.h"

@interface MessageCell ()

//时间
@property (nonatomic, weak)UILabel *time;
//正文
@property (nonatomic, weak)UIButton *textView;
//用户头像
@property (nonatomic, weak)UIImageView *icon;



@end

@implementation MessageCell

+(instancetype) messageCellWithTableView:(UITableView *)tableview{
    static NSString *ID = @"messageCell";
    MessageCell *cell = [tableview dequeueReusableCellWithIdentifier:ID];
    if(cell == nil){
        cell = [[self alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
        
    }
    return cell;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        //1.时间
        UILabel *time = [[UILabel alloc]init];
        [self.contentView addSubview:time];
        time.textAlignment = NSTextAlignmentCenter;
        time.font = [UIFont systemFontOfSize:13.0f];
        self.time = time;
        
        //2.正文
        UIButton *textView = [[UIButton alloc]init];
        [self.contentView addSubview:textView];
        self.textView = textView;
        textView.titleLabel.font = BUTTONFONT;
        textView.titleLabel.numberOfLines = 0;
//       self.textView.backgroundColor = [UIColor grayColor];
        textView.contentEdgeInsets = UIEdgeInsetsMake(20, 20, 20, 20);
        
        //3.头像
        UIImageView *icon = [[UIImageView alloc]init];
        [self.contentView addSubview:icon];
        self.icon = icon;
        
    }
    return self;
}

-(void)setMessageFrame:(MessageFrameMoudel *)messageFrame{
    _messageFrame = messageFrame;

    MessageMoudel *moudel = messageFrame.message;
    self.time.frame = messageFrame.timeFrame;
    self.time.text = moudel.time;
    self.time.textColor = [UIColor whiteColor];
    self.icon.frame = messageFrame.iconFrame;
    if ([moudel.type isEqualToNumber:[NSNumber numberWithInt:MineMessage]]) {
        self.icon.image = [UIImage imageNamed:@"ZhenBai"];
//        self.icon.image = [UIImage imageNamed:@"JianNiang"];

    }else{
        self.icon.image = [UIImage imageNamed:@"JianNiang"];
//        self.icon.image = [UIImage imageNamed:@"ZhenBai"];
        
    }
    
    //正文
    self.textView.frame = messageFrame.textViewFrame;
    [self.textView setTitle:moudel.text forState:UIControlStateNormal];
    //拉伸并设置背景图片
    if ([moudel.type isEqualToNumber:[NSNumber numberWithInt:MineMessage] ]) {
        [self.textView setBackgroundImage:[self resizeWithImageName:@"chat_send_nor" ] forState:UIControlStateNormal];
        [self.textView setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    }else{
        [self.textView setBackgroundImage:[self resizeWithImageName:@"chat_recive_nor"] forState:UIControlStateNormal];
        [self.textView setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];

    }
//    self.backgroundColor = [UIColor grayColor];
    self.backgroundColor=[UIColor clearColor];//关键语句

//    self.backgroundView = [UIImage imageNamed:@"Background"];

}

//拉伸气泡图片
-(UIImage *) resizeWithImageName:(NSString *)name{
    UIImage *image = [UIImage imageNamed:name];
    CGFloat width  = image.size.width*0.5f  - 1;
    CGFloat height = image.size.height*0.5f - 1;
    UIImage *resizeImage = [image resizableImageWithCapInsets:UIEdgeInsetsMake(height, width, height, width)];//For iOS 5.0 and later
//    [image resizableImageWithCapInsets:<#(UIEdgeInsets)#> resizingMode:<#(UIImageResizingMode)#>] For iOS 6.0 and  later
//    [image stretchableImageWithLeftCapWidth:<#(NSInteger)#> topCapHeight:<#(NSInteger)#>] For iOS 5.0 and later
    return resizeImage;
}

//-(void)awakeFromNib{
//    //Intilization code
//
//}
//
//-(void)setSelected:(BOOL)selected animated:(BOOL)animated{
//    [super setSelected:selected animated:animated];
//    //Config the view for the select state
//}
//



@end
