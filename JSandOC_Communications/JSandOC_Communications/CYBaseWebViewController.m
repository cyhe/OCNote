//
//  LYBaseWebViewController.m
//  LYCampusSocial
//
//  Created by esirnus on 2017/5/9.
//  Copyright © 2017年 HHLY. All rights reserved.
//

#import "CYBaseWebViewController.h"

@interface CYBaseWebViewController () <UIWebViewDelegate>

@end

@implementation CYBaseWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.webView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - UIWebView Delegate
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {
   
    self.jsContext = [webView valueForKeyPath:@"documentView.webView.mainFrame.javaScriptContext"];
    self.jsContext[@"SeedObjectCModel"] = self;
    
    [self.getHandlers enumerateKeysAndObjectsUsingBlock:^(NSString * _Nonnull key, id<JSExport>  _Nonnull obj, BOOL * _Nonnull stop) {
        self.jsContext[key] = obj;
    }];

#ifdef DEBUG
    self.jsContext[@"console"][@"log"] = ^(JSValue * msg) {
        NSLog(@"tokenH5  log : %@", msg);
    };
    self.jsContext[@"console"][@"warn"] = ^(JSValue * msg) {
        NSLog(@"H5  warn : %@", msg);
    };
    self.jsContext[@"console"][@"error"] = ^(JSValue * msg) {
        NSLog(@"H5  error : %@", msg);
    };
#endif
    self.jsContext.exceptionHandler = ^(JSContext *context, JSValue *exception){
        context.exception = exception;
        NSLog(@"exception:--> %@",exception);
    };
    
    return YES;
}

- (void)webViewDidStartLoad:(UIWebView *)webView {
    
}

- (void)webViewDidFinishLoad:(UIWebView *)webView {
    
    
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error {
    
}


#pragma mark - JS-OC交互

- (void)showLoading
{
    dispatch_async(dispatch_get_main_queue(), ^{
        
    });
}

- (void)hideLoading
{
    dispatch_async(dispatch_get_main_queue(), ^{
        
    });
}

/* OC-to-Js */

- (NSString *)getUserId {
    return nil;
}

- (NSString *)getLoginToken {
    return nil;
}

- (NSString *)getVersionCode {
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    NSString *app_Version = [infoDictionary objectForKey:@"CFBundleShortVersionString"];
    return app_Version;
}

- (NSString *)getClientType {
    return @"3";
}

/* JS-to-OC */
- (void)submitSuccess {}


- (void)showTip:(NSString *)msg {}


- (void)setTitleName:(NSString *)title {}


#pragma mark - Lazy Load

- (UIWebView *)webView {
    if (!_webView) {
        _webView = [[UIWebView alloc] init];
        _webView.backgroundColor = [UIColor whiteColor];
        _webView.delegate = self;
    }
    return _webView;
}

@end



