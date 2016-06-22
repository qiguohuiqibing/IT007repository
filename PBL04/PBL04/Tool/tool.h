//
//  tool.h
//  PBL04
//
//  Created by Mac on 16/6/20.
//  Copyright © 2016年 qiguohui. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "AFNetworking.h"





@interface tool : NSObject
+(void)getshujuinfo:(void(^)(NSArray*arr)) complay;
+(void)createtableviewinfo:(void(^)(NSArray*arr))complay;



@end
