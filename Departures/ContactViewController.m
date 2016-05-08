//
//  ContactViewController.m
//  Departures
//
//  Created by Departures on 3/24/16.
//  Copyright © 2016 Departures. All rights reserved.
//

#import "ContactViewController.h"


@implementation ContactViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void) accountButtonDidPress:(id)sender{
   
    [self performSegueWithIdentifier:@"contactToAcountsViewController" sender:self];
}



//更多功能触发
- (IBAction)moreButtonDidPress:(id)sender {
    NSMutableArray *menu = [NSMutableArray array];
    for (NSInteger i = 0; i < [self titles].count; i++) {
        WBPopMenuModel *info = [WBPopMenuModel new];
        info.image = [self images][i];
        info.title = [self titles][i];
        [menu addObject:info];
    }
    [[WBPopMenuSingleton shareManager]showPopMenuSelecteWithFrame:150  bounds:CGRectMake(0, 0, 150, 300) item:menu action:^(NSInteger index){
        //在这里加入触发动作
        NSLog(@"%li",(long)index);
    }];
}

//初始化Menu的菜单内容
- (NSArray *) titles {
    return @[@"扫一扫",
             @"加好友",
             @"创建讨论组",
             @"发送到电脑",
             @"面对面快传",
             @"收钱"];
}
//初始化Menu的菜单内容
- (NSArray *) images {
    return @[@"right_menu_QR",
             @"right_menu_addFri",
             @"right_menu_multichat",
             @"right_menu_sendFile",
             @"right_menu_facetoface",
             @"right_menu_payMoney"];
}





/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
