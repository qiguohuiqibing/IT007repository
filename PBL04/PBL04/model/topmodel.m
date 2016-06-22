//
//  topmodel.m
//  PBL04
//
//  Created by Mac on 16/6/20.
//  Copyright © 2016年 qiguohui. All rights reserved.
//

#import "topmodel.h"

@implementation topmodel
-(instancetype)initwithgreatedic:(NSDictionary*)dic{
    
    
        self.picUrl=dic[@"component"][@"picUrl"];
  
    return self;

}
+(instancetype)greateinitgreatedic:(NSDictionary*)dic{

    return [[super alloc]initwithgreatedic:dic];

}

@end
