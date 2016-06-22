//
//  tool.m
//  PBL04
//
//  Created by Mac on 16/6/20.
//  Copyright © 2016年 qiguohui. All rights reserved.
//

#import "tool.h"
#import "topmodel.h"
#import "onemode.h"

@implementation tool
+(void)getshujuinfo:(void(^)(NSArray*arr))complay{
    AFHTTPSessionManager*mange = [AFHTTPSessionManager manager];
    mange.responseSerializer = [AFHTTPResponseSerializer serializer];
    mange.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"application/json"];
    NSString*str = @"http://api2.hichao.com/banner?ga= %2Fbanner&gv=55&gi=864737011278738&access_to ken=&gos=5.1.5&p=Lenovo +K860&gc=qihu360&gn=mxyc_adr&gf=ios&gs=720x1 200";
    NSString*stre= [str stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    [mange GET:stre parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        NSLog(@"%@",downloadProgress);
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        if (responseObject) {
            NSDictionary*dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
            
            NSArray*arr=dic[@"data"][@"items"];
            NSLog(@"%@",arr);
            NSMutableArray*array = [NSMutableArray array];
            for (NSDictionary*dic in arr) {
                topmodel*model = [topmodel greateinitgreatedic:dic];
                [array addObject:model];
            }
            if (complay) {
                complay(array);
            }else{
            
                if (complay) {
                    complay(nil);
                }
            
            }
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@",error.localizedDescription);
        if (complay) {
            complay(nil);
        }
    }];



}
+(void)createtableviewinfo:(void(^)(NSArray*arr))complay{

    AFHTTPSessionManager*mange = [AFHTTPSessionManager manager];
    mange.responseSerializer = [AFHTTPResponseSerializer serializer];
    mange.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"application/json"];
    NSString*str = @"http://api2.hichao.com/stars?category=%E5%85%A8%E9%83%A8&pin=79323&ga=%2Fstars&flag=&gv=55&gi=864737011278738&access_token=&gos=5.1.5&p=Lenovo+K860&gn=mxyc_adr&gc=qihu360&gs=720x1200&gf=ios&lts=1407641954";
    [mange GET:str parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        NSLog(@"%@",downloadProgress);
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSDictionary*dic=[NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        NSLog(@"%@",dic);
        NSMutableArray*arr=dic[@"data"][@"items"];
        NSMutableArray*array = [NSMutableArray array];
        [arr removeObjectAtIndex:0];
        for (NSDictionary*dictor in arr) {
            onemode*model = [onemode greateinitwithgreatetableview:dictor];
            [array addObject:model];
        }
        if (complay) {
            complay(array);
        }else{
            if (complay) {
                complay(nil);
            }
        
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@",error.localizedDescription);
        if (complay) {
            complay(nil);
        }
    }];


}


@end
