//
//  ViewController.m
//  PBL04
//
//  Created by Mac on 16/6/20.
//  Copyright © 2016年 qiguohui. All rights reserved.
//

#import "ViewController.h"
#import "MainViewController.h"
#import "SecondViewController.h"
#import "tool.h"


@interface ViewController ()<UIScrollViewDelegate>
{
    UIScrollView*_scrollview;

}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    self.navigationController.navigationBar.hidden = YES;
     self.automaticallyAdjustsScrollViewInsets = NO;
    [self createscrollview];
    
}
- (void)createscrollview {
    UIScrollView * scrollview = [[UIScrollView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    scrollview.backgroundColor =[UIColor cyanColor];
    [self.view addSubview:scrollview];
    for (int i = 0; i < 4; i++) {
        UIImageView * image = [[UIImageView alloc]initWithFrame:CGRectMake(scrollview.frame.size.width*i, 0,scrollview.frame.size.width, scrollview.frame.size.height)];
        image.image = [UIImage imageNamed:[NSString stringWithFormat:@"splash_img%d",i+1]];
        [scrollview addSubview:image];
    }
    scrollview.pagingEnabled = YES;
    scrollview.delegate = self;
    scrollview.contentSize = CGSizeMake(scrollview.frame.size.width*4, 0);
    _scrollview = scrollview;
    UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
    
    button.frame = CGRectMake((scrollview.frame.size.width-150)/2, scrollview.frame.size.height-80, 150, 40);

    
    //button.backgroundColor =[UIColor yellowColor];
    [button addTarget: self action:@selector(buttonclick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{

    if (scrollView.contentOffset.x>3*_scrollview.frame.size.width+20) {
        [self pushnext];
    }

}
- (void)buttonclick: (UIButton*)sender {
    NSLog(@"123");
    [self pushnext];
    
}
- (void)pushnext {
    
    UINavigationController * mainvc = [[UINavigationController alloc]initWithRootViewController:[MainViewController new]];
    UINavigationController*secondvc = [[UINavigationController alloc]initWithRootViewController:[SecondViewController new]];
    UITabBarController * tabbar = [[UITabBarController alloc]init];
    tabbar.viewControllers = @[mainvc,secondvc];
     NSLog(@"123");
    [self.navigationController pushViewController:tabbar animated:YES];
    



}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
