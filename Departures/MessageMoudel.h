//
//  MessageMoudel.h
//  Departures
//
//  Created by Departures on 4/13/16.
//  Copyright © 2016 Departures. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Constant.h"
//typedef enum {
//    MineMessage = 0 ,
//    OthersMessage
//}MessageMoudelType;

//MessageMoudelType
@interface MessageMoudel : NSObject
//正文
@property (nonatomic , copy) NSString *text;

//时间
@property (nonatomic , copy) NSString *time;

//发送类型
@property (nonatomic , assign) NSNumber *type;
//是否隐藏时间
@property (nonatomic , assign) BOOL hideTime;


-(instancetype) initWithDictionary:(NSDictionary *)dict;

+(instancetype)messageWithDictionary:(NSDictionary *)dict;

+ (instancetype)messageWithDict:(NSDictionary *)dict;
- (instancetype)initWithDict:(NSDictionary *)dict;
@end
