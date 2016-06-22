//
//  onemode.m
//  PBL04
//
//  Created by Mac on 16/6/21.
//  Copyright © 2016年 qiguohui. All rights reserved.
//

#import "onemode.h"

@implementation onemode
-(instancetype)initwithgreatetableview:(NSDictionary*)dic{
    self.collectionCount =[ dic[@"component"][@"action"][@"collectionCount"]integerValue];
    self.descriptiona=dic[@"component"][@"action"][@"description"];
    self.picUrl=dic[@"component"][@"picUrl"];
    self.width=[dic[@"width"]integerValue];
    self.height=[dic[@"height"]integerValue];
    return self;

}
+(instancetype)greateinitwithgreatetableview:(NSDictionary*)dic{

    return [[self alloc]initwithgreatetableview:dic];
}

@end
