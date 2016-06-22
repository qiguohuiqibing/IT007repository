//
//  mainTableViewCell.h
//  PBL04
//
//  Created by Mac on 16/6/20.
//  Copyright © 2016年 qiguohui. All rights reserved.
//

#import <UIKit/UIKit.h>
@class onemode;
typedef void(^callback)();

@interface mainTableViewCell : UITableViewCell
@property(nonatomic,retain)onemode*model;
-(void)tableviewcallbackblock:(callback)buttonblock;
-(void)setAlldefaul;



@end
