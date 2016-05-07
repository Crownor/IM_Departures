//
//  ChatViewController.m
//  Departures
//
//  Created by Departures on 3/24/16.
//  Copyright © 2016 Departures. All rights reserved.
//

#import "ChatViewController.h"
#import "AccountViewController.h"

@implementation ChatViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    UIImage *bgImg = [[UIImage alloc] init];
    [self.tabBarController.tabBar setBackgroundImage:bgImg];
    [self.tabBarController.tabBar setShadowImage:bgImg];

    if ([[[UIDevice currentDevice] systemVersion] compare:@"7.0"] == NSOrderedAscending) {
        [[UITabBar appearance] setSelectedImageTintColor:[UIColor colorWithRed:139.0/255.0 green:146.0/255.0 blue:155.0/255.0 alpha:1.0]];
        [[UITabBar appearance] setSelectionIndicatorImage:bgImg];
      //上面两个是清除item的背景色跟选中背景色
               
        [self.tabBarItem setImage:[[UIImage imageNamed:@"Message"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] ];
        
        
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
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





- (IBAction)accountsButtonDidPress:(id)sender {
    
    [self performSegueWithIdentifier:@"MessageToAccountsViewController" sender:self];
}








@end
