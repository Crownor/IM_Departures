//
//  MessageMoudel.m
//  Departures
//
//  Created by Departures on 4/13/16.
//  Copyright © 2016 Departures. All rights reserved.
//

#import "MessageMoudel.h"

@implementation MessageMoudel


-(instancetype) initWithDictionary:(NSDictionary *)dict{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;

}

+(instancetype)messageWithDictionary:(NSDictionary *)dict{
    return [[self alloc]initWithDictionary:dict ];
    
}
@end
