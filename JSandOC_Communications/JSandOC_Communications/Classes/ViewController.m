//
//  ViewController.m
//  JSandOC_Communications
//
//  Created by cyhe on 2017/9/12.
//  Copyright © 2017年 CYHE. All rights reserved.
//

#import "ViewController.h"
#import "CYJSInterFaceWebViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *button1 = [UIButton buttonWithType:UIButtonTypeCustom];
    button1.frame = CGRectMake(112.5, 150, 150, 50);
    [button1 setTitle:@"加载WebView" forState:UIControlStateNormal];
    [button1 addTarget:self action:@selector(loadWebView) forControlEvents:UIControlEventTouchUpInside];
    [button1 setBackgroundColor:[UIColor colorWithRed:132.0f/255.0f green:132.0f/255.0f blue:132.0f/255.0f alpha:1]];
    button1.layer.cornerRadius = 4;
    button1.layer.masksToBounds = YES;
    
    [self.view addSubview:button1];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}


- (void)loadWebView {
    [self.navigationController pushViewController:[[CYJSInterFaceWebViewController alloc] init] animated:YES];
}

@end
