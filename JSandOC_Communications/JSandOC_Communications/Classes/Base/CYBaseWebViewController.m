//
//  LYBaseWebViewController.m
//  LYCampusSocial
//
//  Created by cyhe on 2017/5/9.
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


- (NSDictionary<NSString *, id<JSExport>> *)getHandlers {
    return @{@"SeedObjectModel" : self};
}

#pragma mark - UIWebView Delegate
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {
   
    self.jsContext = [webView valueForKeyPath:@"documentView.webView.mainFrame.javaScriptContext"];
    
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

/* OC-to-Js */

- (NSString *)getUserId {
    return nil;
}

- (void)showTip:(NSString *)msg {
    dispatch_async(dispatch_get_main_queue(), ^{
        
    });
}
#pragma mark - Lazy Load

- (UIWebView *)webView {
    if (!_webView) {
        _webView = [[UIWebView alloc] initWithFrame:self.view.bounds];
        _webView.backgroundColor = [UIColor whiteColor];
        _webView.delegate = self;
    }
    return _webView;
}

@end



