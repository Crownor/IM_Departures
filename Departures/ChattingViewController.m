//
//  ChattingViewController.m
//  Departures
//
//  Created by Departures on 4/13/16.
//  Copyright © 2016 Departures. All rights reserved.
//
#import "MessageCell.h"
#import "ChattingViewController.h"
@interface ChattingViewController()<UITableViewDataSource,UITableViewDelegate,UITextFieldDelegate>

@property(nonatomic , strong)NSMutableArray *messages;
- (void)logDic:(NSDictionary *)dic;
@end

@implementation ChattingViewController

@synthesize contentOffSetY;
@synthesize oldContentOffSetY;
@synthesize newContentOffSetY;

-(void)viewDidLoad{
    [super viewDidLoad];
    self.tableView.allowsSelection = NO;//更改为cell不可选
//    MessageMoudel *messageMoudel = [[MessageMoudel alloc]init];
//    self.tableView.backgroundColor = [UIColor grayColor];
    
//    UIImageView *backgroundView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"Background"]];
//    [self.tableView setBackgroundView:backgroundView];
   [ self.backgroundView setImage:[UIImage imageNamed:@"Background"]];
    
    
    self.tableView.backgroundColor = [UIColor clearColor];
    
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    self.titleView.backgroundColor = [UIColor clearColor];
//    self.titleLabel.font = [UIFont fontWithName:@"System" size:;]
    self.titleLabel.textColor = [UIColor whiteColor];
    
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(keyboardDidChangeFrame:) name:UIKeyboardWillChangeFrameNotification object:nil];
    
    
    
    //设置inputField的左边距，并令其一直显示
    self.inputView.leftView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 8, 0)];
    self.inputView.leftViewMode = UITextFieldViewModeAlways;
    
    
    
    
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    
    NSLog(@"%@",textField.text);
    //1.添加数据模型
    MessageMoudel *messageMoudle = [[MessageMoudel alloc]init];
    
    messageMoudle.time = @"16:88";
    messageMoudle.text = textField.text;
    messageMoudle.type = OthersMessage;
    
    //设置内容frame
    MessageFrameMoudel *messageFrameMoudle = [[MessageFrameMoudel alloc]init];
    //将messageMoudle复制给messageFrameMoudle的message
    messageFrameMoudle.message = messageMoudle;
    [self.messages addObject:messageFrameMoudle];
    
    //2.刷新表格
    [self.tableView reloadData];
    //迷之要求直接return Yes
    return YES;
}




//

-(void)keyboardDidChangeFrame:(NSNotification *)noti{
    NSLog(@"----------%@",noti.userInfo);
    
    self.view.window.backgroundColor = [UIColor whiteColor];//避免在弹出键盘的时候出现连接不上然后有一段是黑色的尴尬情况
    
    
    
//    self.tableView.bounds.size.height -= 216;
//    
    CGRect frame = [ noti.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue ];
//
//    self.tableView.transform = CGAffineTransformMakeTranslation(0, frame.origin.y - 216);
//    self.toolView.transform =
    CGFloat keyDuration = [noti.userInfo [UIKeyboardAnimationDurationUserInfoKey] floatValue];
    [UIView animateWithDuration: keyDuration animations:^{
        self.tableView.transform = CGAffineTransformMakeTranslation(0, frame.origin.y - SCREENHEIGHT);//此处存在问题，table只是向上平移了，而且Title并没有覆盖table
//        [self.tableView setFrame:CGRectMake(0, 0, self.tableView.frame.size.width, self.tableView.frame.size.height -frame.origin.y+SCREENHEIGHT)];
        self.toolView.transform = CGAffineTransformMakeTranslation(0, frame.origin.y - SCREENHEIGHT);
        
        [self.view bringSubviewToFront:_titleView];
        
        
        
    }];
    
    
//    [NSNumber numberWithInt:<#(int)#>]
    
    
//    
//    
//    self.tableView.transform = CGAffineTransformMakeTranslation(0, -216);
//    self.toolView.transform = CGAffineTransformMakeTranslation(0, -216);
    
    
//    self.tableView.bounds = CGRectMake(self.tableView.bounds.origin.x, self.tableView.bounds.origin.y, self.tableView.bounds.size.width, self.tableView.bounds.size.height-216);
//    self.toolView.bounds = CGRectMake(self.toolView.bounds.origin.x, self.toolView.bounds.origin.y-216, self.toolView.bounds.size);
    
}

//开始拖拽视图
-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
     contentOffSetY = scrollView.contentOffset.y;
}

// 滚动时调用此方法(手指离开屏幕后)
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    newContentOffSetY =scrollView.contentOffset.y;
    
     if (newContentOffSetY > oldContentOffSetY && oldContentOffSetY > contentOffSetY) {//向上滚动
         
     } else if (newContentOffSetY < oldContentOffSetY && oldContentOffSetY < contentOffSetY) { // 向下滚动
         [self.view endEditing:YES];
     } else {//拖拽
         NSLog(@"Dragging");
     }
    
    if (scrollView.dragging) {
        if ((scrollView.contentOffset.y - contentOffSetY) > 5.0f) {  // 向上拖拽
            
        } else if ((contentOffSetY - scrollView.contentOffset.y) > 5.0f) {   // 向下拖拽
         
            [self.view endEditing:YES];

        }
    }
}

// 完成拖拽(滚动停止时调用此方法，手指离开屏幕前)
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate

{
    
    // NSLog(@"scrollViewDidEndDragging");
    
    oldContentOffSetY = scrollView.contentOffset.y;
    
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
