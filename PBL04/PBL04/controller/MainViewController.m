//
//  MainViewController.m
//  PBL04
//
//  Created by Mac on 16/6/20.
//  Copyright © 2016年 qiguohui. All rights reserved.
//

#import "MainViewController.h"
#import "Header.h"

#import "mainTableViewCell.h"
#import "tool.h"
#import "topmodel.h"
#import "UIImageView+WebCache.h"
#import "onemode.h"
static NSString *cellID = @"cellID";
typedef enum:NSUInteger{
tableleft = 100,
    tableright,
    tablescroll,


}falltable;

@interface MainViewController ()<UITableViewDataSource,UITableViewDelegate,UIScrollViewDelegate>{
    UIScrollView*_scrollview;
    BOOL count[3];
    UIView*_view;
    CGFloat _colheight[2];

}
@property(nonatomic,retain)NSMutableArray*indexArray;
@property(nonatomic,retain)NSMutableArray*datarray;
@property(nonatomic,strong)NSMutableArray*array;
@property(nonatomic,strong)NSMutableArray*tablearr;

@end

@implementation MainViewController
-(NSMutableArray*)indexArray{
    if (!_indexArray) {
        _indexArray = [NSMutableArray arrayWithObjects:[NSMutableArray array],[NSMutableArray array], nil];
    }
    return _indexArray;
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.tablearr = [NSMutableArray array];
    count[0]=YES;
    self.array = [NSMutableArray array];
    self.title = @"首页";
    self.navigationController.tabBarItem.title =@"首页";
    self.navigationController.tabBarItem.image=[UIImage imageNamed:@"list_icon_like"];
    
    [self tableviewdemo];
}
-(void)tableviewdemo{
    

[tool createtableviewinfo:^(NSArray *arr) {
    NSLog(@"123");
    [self.tablearr addObjectsFromArray:arr];
    NSLog(@"+++++++++%ld",self.tablearr.count);
   
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(4 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self createscrollview];
    });
    
    
}];
    
}
- (void)createscrollview{

    UIScrollView * scrollview = [[UIScrollView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    scrollview.backgroundColor =[UIColor cyanColor];
    scrollview.tag = tablescroll;
    [self.view addSubview:scrollview];
    _scrollview = scrollview;
    _scrollview.userInteractionEnabled= YES;
    _scrollview.delegate = self;
    [tool getshujuinfo:^(NSArray *arr) {
        [self.array addObjectsFromArray:arr];
        [self greateviewscrollview];
        [self reloadata];
        
    }];

    for (NSInteger i = 0; i<2; i++) {
        UITableView *table = [[UITableView alloc]initWithFrame:CGRectMake(Mainwidth*i/2,400, Mainwidth/2, MainHeight)style:UITableViewStylePlain];
        table.delegate = self;
        table.dataSource = self;
        table.separatorStyle = UITableViewCellSeparatorStyleNone;
        table.tag = tableleft + i;
        if (0 == i) {
            table.backgroundColor = [UIColor yellowColor];
        }else{
        
            table.backgroundColor = [UIColor redColor];
        
        };
        table.tableFooterView = [UIView new];
        table.scrollEnabled =NO;
        [scrollview addSubview:table];
        
        [table registerClass:[mainTableViewCell class] forCellReuseIdentifier:cellID];
    }
    
    

}
-(void)reloadata{
    
    for (NSInteger a=0; a<self.tablearr.count; a++) {
        NSInteger index = _colheight[0]<=_colheight[1]?0:1;
        onemode*model = self.tablearr[a];
        _colheight[index]+= (Mainwidth/2-10)/model.width*model.height+50;
        [self.indexArray[index] addObject:@(a)];
        
    }
    UIScrollView * scrollview = (UIScrollView*)[self.view viewWithTag:tablescroll];
    scrollview.contentSize = CGSizeMake(0, MAX(_colheight[0], _colheight[1]));
    for (NSInteger i=0; i<2; i++) {
        UITableView * table = (UITableView*)[scrollview viewWithTag:tableleft+i];
        [table reloadData];
      
    }

}
-(void)greateviewscrollview{
    UIScrollView *scrollview01 = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, Mainwidth, 300)];
     NSLog(@"=====>>>%ld",_array.count);
    scrollview01.backgroundColor = [UIColor cyanColor];
    scrollview01.userInteractionEnabled = YES;
    [_scrollview addSubview:scrollview01];
    for (NSInteger a=0; a<self.array.count; a++) {
        topmodel*model = self.array[a];
      
        UIImageView*image = [[UIImageView alloc]initWithFrame:CGRectMake(a*Mainwidth, 0, Mainwidth, 300)];
        [image sd_setImageWithURL:[NSURL URLWithString:model.picUrl]];
        [scrollview01 addSubview:image];
        
       
        
    }
    scrollview01.pagingEnabled = YES;
    scrollview01.contentSize = CGSizeMake(self.array.count*Mainwidth, 0);
    
    
    
    UIView*view = [[UIView alloc]initWithFrame:CGRectMake(0, scrollview01.frame.size.height, Mainwidth, 100)];
    view.backgroundColor = [UIColor cyanColor];
    view.userInteractionEnabled = YES;
    [_scrollview addSubview:view];
    _view=view;
    
    for (NSInteger a=0; a<3; a++) {
         UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake((Mainwidth-100)/3*a+50, 20, (Mainwidth-150)/3, 40);
        if (a==0) {
            [button setTitle:@"猜你喜欢" forState:UIControlStateNormal];
            [button setBackgroundImage:[UIImage imageNamed:@"1"] forState:UIControlStateNormal];
            
        }else if (a==1){
        
        [button setTitle:@"热门" forState:UIControlStateNormal];
            [button setBackgroundImage:[UIImage imageNamed:@"1"] forState:UIControlStateNormal];
        
        }else{
        
        [button setTitle:@"最新" forState:UIControlStateNormal];
            
        }
        button.tag = a+1;
        BOOL b =count[button.tag - 1];
        if (b==YES) {
            [button setBackgroundImage:[UIImage imageNamed:@"1"] forState:UIControlStateNormal];
        }else{
        [button setBackgroundImage:nil forState:UIControlStateNormal];
        
        }
        [button addTarget:self action:@selector(buttonclick:) forControlEvents:UIControlEventTouchUpInside];
        [view addSubview:button];
    }
   
   
    
    
}
-(void)buttonclick:(UIButton*)sender{
    NSLog(@"123");
    count[0]=NO;
    count[1]=NO;
    count[2]=NO;
    count[sender.tag-1]=!count[sender.tag-1];
    
    [self greateviewscrollview];
    
}

    
    



-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    if (scrollView.tag ==tablescroll) {
        UITableView * left = (UITableView*)[self.view viewWithTag:tableleft];
        UITableView *right = (UITableView *)[self.view viewWithTag:tableright];
        if (scrollView.contentOffset.y<=300) {
            left.frame = CGRectMake(0, 300, Mainwidth/2, MainHeight);
            
        }
        left.center = CGPointMake(left.center.x, scrollView.contentOffset.y+MainHeight/2);
        right.center = CGPointMake(right.center.x, self.view.center.y+scrollView.contentOffset.y);
        left.contentOffset = scrollView.contentOffset;
        right.contentOffset =scrollView.contentOffset;
    }



}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    NSInteger index = tableView.tag -tableleft;
    
    NSArray * arr = self.indexArray[index];
    NSLog(@"---------%ld",arr.count);
    
    return arr.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    NSMutableArray * arr =self.indexArray[tableView.tag - tableleft];
    if (arr.count!= 0) {
        NSNumber *num = arr[indexPath.row];
       onemode*model = self.tablearr[[num integerValue] ];
        NSInteger height =(Mainwidth/2-10)/model.width*model.height+50;
        return 300;
        
    }
    return 0;

}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"tttttt");
    mainTableViewCell*cell = [tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];
    NSMutableArray * arr = self.indexArray[tableView.tag-tableleft];
    //[cell setAlldefaul];
    if (arr) {
        NSNumber * number = arr[indexPath .row];
        onemode*model = self.tablearr[[number integerValue]];
        cell.model =model;
        
        NSLog(@"height=%ld width=%ld ",cell.model.height,cell.model.width );
//        [cell tableviewcallbackblock:^{
//           
//        }];

    
    }
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.

*/

@end
