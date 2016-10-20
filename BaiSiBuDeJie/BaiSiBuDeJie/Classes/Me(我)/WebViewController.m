//
//  WebViewController.m
//  BaiSiBuDeJie
//
//  Created by YF on 16/10/20.
//  Copyright © 2016年 YF. All rights reserved.
//

#import "WebViewController.h"
#import <WebKit/WebKit.h>

@interface WebViewController ()
@property (weak, nonatomic) IBOutlet UIView *containView;
@property (nonatomic, strong) WKWebView * webView;
@property (weak, nonatomic) IBOutlet UIProgressView *progressView;

@end

@implementation WebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = _titleStr;
    self.webView = [[WKWebView alloc] init];
    [self.containView addSubview:self.webView];
    [self.webView loadRequest:[NSURLRequest requestWithURL:_url]];
    //监听进度
    [self.webView addObserver:self forKeyPath:@"estimatedProgress" options:NSKeyValueObservingOptionNew context:nil];
    
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context
{
    //给进度条赋值,当加载完成的时候,隐藏进度条
    self.progressView.progress = self.webView.estimatedProgress;
    self.progressView.hidden = self.webView.estimatedProgress >= 1;
}

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    self.webView.frame = self.containView.bounds;
}
- (IBAction)lastPage:(id)sender {
    [self.webView goBack];
}
- (IBAction)nextPage:(id)sender {
    [self.webView goForward];
}
- (IBAction)refresh:(id)sender {
    [self.webView reload];
}
 

- (void)dealloc
{
    [self.webView removeObserver:self forKeyPath:@"estimatedProgress"];
}


@end
