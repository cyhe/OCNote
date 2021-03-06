//
//  CYBaseWebViewController.h
//  LYCampusSocial
//
//  Created by cyhe on 2017/5/9.
//  Copyright © 2017年 HHLY. All rights reserved.
//


#import <JavaScriptCore/JavaScriptCore.h>
#import <UIKit/UIKit.h>
#import <WebKit/WebKit.h>

// 使用JSCore所有的方法需要声明协议并实现,作用:所规定的方法变量等会对js开放,可以通过js调用到
// 该声明的方法必须为@require

@protocol CYBaseOpenMethodToJSProtocol <JSExport>

- (NSString *)getUserId;

- (void)showTip:(NSString *)msg;

@end

@interface CYBaseWebViewController : UIViewController <CYBaseOpenMethodToJSProtocol>

@property (nonatomic, strong) UIWebView *webView;

@property (nonatomic, strong) JSContext *jsContext;

/**
 子类需要重写这个方法，返回对应的处理器
 
 @return return JSContext 对象方法绑定key,对JS开放
 */
- (NSDictionary<NSString *, id<JSExport>> *)getHandlers;

/**
 webView的代理方法,使用时需要super
 */
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType;
- (void)webViewDidStartLoad:(UIWebView *)webView;
- (void)webViewDidFinishLoad:(UIWebView *)webView;
- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error;

@end
