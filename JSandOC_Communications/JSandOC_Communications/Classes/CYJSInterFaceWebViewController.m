//
//  CYJSInterFaceWebViewController.m
//  JSandOC_Communications
//
//  Created by esirnus on 2017/9/13.
//  Copyright © 2017年 CYHE. All rights reserved.
//

#import "CYJSInterFaceWebViewController.h"

@interface CYJSInterFaceWebViewController ()

@end

@implementation CYJSInterFaceWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self loadwebView];
    
}

- (void)loadwebView {
    
    NSURL* htmlURL = [[NSBundle mainBundle] URLForResource: @"testWebView"
                                             withExtension: @"html"];
    [self.webView loadRequest:[[NSURLRequest alloc] initWithURL:htmlURL]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

- (NSDictionary<NSString *,id<JSExport>> *)getHandlers {
    return @{@"SeedObjectModel" : self};
}


- (NSString *)getUserId {
    return @"cyhe90849";
}

- (void)showTip:(NSString *)msg {
    NSLog(@"%@",msg);
}


- (void)dealloc {
    NSLog(@"%s",__func__);
}


@end
