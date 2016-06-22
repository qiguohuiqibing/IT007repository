//
//  onemode.h
//  PBL04
//
//  Created by Mac on 16/6/21.
//  Copyright © 2016年 qiguohui. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface onemode : NSObject
@property(nonatomic,assign)NSInteger collectionCount;
@property(nonatomic,copy)NSString*descriptiona;
@property(nonatomic,copy)NSString*picUrl;
@property(nonatomic,assign)NSInteger height;
@property(nonatomic,assign)NSInteger width;

-(instancetype)initwithgreatetableview:(NSDictionary*)dic;
+(instancetype)greateinitwithgreatetableview:(NSDictionary*)dic;



@end
