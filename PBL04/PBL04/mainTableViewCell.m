//
//  mainTableViewCell.m
//  PBL04
//
//  Created by Mac on 16/6/20.
//  Copyright © 2016年 qiguohui. All rights reserved.
//

#import "mainTableViewCell.h"

#import "Header.h"
#import "onemode.h"
#import "UIButton+WebCache.h"

@interface mainTableViewCell (){
    UIImageView *_imageview;
    UILabel *_title;
    UIButton *_button;
    UIView *_bgview;

}
@property(nonatomic,copy)callback blockHandle;

@end

@implementation mainTableViewCell

- (void)awakeFromNib {
    // Initialization code
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{

    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self createview];
    }
    return self;
}
-(void)createview{
    UIView *bgview = [[UIView alloc]initWithFrame:CGRectZero];
    [self.contentView addSubview:bgview];
    _bgview =bgview;
    UIImageView * imageview = [[UIImageView alloc]initWithFrame:CGRectZero];
    imageview.backgroundColor = [UIColor yellowColor];
    [bgview addSubview:imageview];
    _imageview =imageview;
    UILabel *lable = [[UILabel alloc]initWithFrame:CGRectZero];
    lable.text = @"";
    _title = lable;
    UIButton * button = [[UIButton alloc]initWithFrame:CGRectZero];
    [button addTarget:self action:@selector(buttonclick:) forControlEvents:UIControlEventTouchUpInside];
    [button setTitle:@"点我" forState:UIControlStateNormal];
    [bgview addSubview:button];
    _button = button;


}
-(void)buttonclick:(UIButton*)sender{

    if (self.blockHandle) {
        self.blockHandle();
    }

}
-(void)setModel:(onemode *)model{
    if (_model!=model) {
        _model = model;
        [self setNeedsLayout];
    }

}
-(void)layoutSubviews{
   onemode*model=self.model;
    
        _button.frame = CGRectMake(5, 5,Mainwidth/2-10 ,300);
    [_button sd_setBackgroundImageWithURL:[NSURL URLWithString:model.picUrl] forState:UIControlStateNormal];
   

        _title.frame = CGRectMake( 5, CGRectGetMaxY(_imageview.frame)+5, Mainwidth/2-90, 40);
    _title.text = model.descriptiona;


    _bgview.frame = self.contentView.bounds;

}
-(void)tableviewcallbackblock:(callback)buttonblock{

    self.blockHandle = buttonblock;
}
-(void)setAlldefaul{
    [_bgview removeFromSuperview];
    _bgview = nil;
    [self createview];

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
