//
//  ChattingViewController.m
//  Departures
//
//  Created by Departures on 4/13/16.
//  Copyright © 2016 Departures. All rights reserved.
//
#import "MessageCell.h"
#import "ChattingViewController.h"
@interface ChattingViewController()<UITableViewDataSource,UITableViewDelegate>

@property(nonatomic , strong)NSMutableArray *messages;
- (void)logDic:(NSDictionary *)dic;
@end

@implementation ChattingViewController

-(void)viewDidLoad{
    [super viewDidLoad];
    self.tableView.allowsSelection = NO;//更改为cell不可选
//    MessageMoudel *messageMoudel = [[MessageMoudel alloc]init];
//    self.tableView.backgroundColor = [UIColor grayColor];
    
    UIImageView *backgroundView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"Background"]];
    [self.tableView setBackgroundView:backgroundView];
    
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
}


-(void)logDic:(NSDictionary *)dic
{

    return;
}
//隐藏状态栏
- (BOOL)prefersStatusBarHidden
{
    return YES;
}


-(NSMutableArray *)messages{
    if (_messages == nil) {

        NSArray *array = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"messages.plist" ofType:nil]];
        NSMutableArray *messageArray = [NSMutableArray array];
    
        for (NSDictionary *dict in array) {
 /*作用是打印出dict 调试用
            NSString *tempStr1 = [[dict description] stringByReplacingOccurrencesOfString:@"\\u" withString:@"\\U"];
            NSString *tempStr2 = [tempStr1 stringByReplacingOccurrencesOfString:@"\"" withString:@"\\\""];
            NSString *tempStr3 = [[@"\"" stringByAppendingString:tempStr2] stringByAppendingString:@"\""];
            NSData *tempData = [tempStr3 dataUsingEncoding:NSUTF8StringEncoding];
            NSString *str = [NSPropertyListSerialization propertyListFromData:tempData mutabilityOption:NSPropertyListImmutable format:NULL errorDescription:NULL];
            NSLog(@"dic:%@",str);
            */
            
            MessageMoudel *messag = [MessageMoudel messageWithDictionary:dict];
            
            //取出上一个模型
            MessageFrameMoudel *lastMessage = [messageArray lastObject];
            
            //决定是否要隐藏时间
            messag.hideTime = [messag.time isEqualToString:lastMessage.message.time];
            
            MessageFrameMoudel *fm = [[MessageFrameMoudel alloc]init];
            fm.message = messag;
            [messageArray addObject:fm];
            
        }
        
        _messages = messageArray;
    }
    return _messages;
}

//-(CGf)

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    MessageFrameMoudel *model = self.messages[indexPath.row];

    return model.cellHeight;
}

#pragma mark TableView 的数据源方法
-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.messages.count;
}


-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    MessageCell *messageCell = [MessageCell messageCellWithTableView:tableView];
    MessageFrameMoudel *model = self.messages[indexPath.row];
    messageCell.messageFrame = model;
    return messageCell;
}

@end
