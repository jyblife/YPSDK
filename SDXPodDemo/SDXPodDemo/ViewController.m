//
//  ViewController.m
//  SDXPodDemo
//
//  Created by admin on 2019/3/28.
//  Copyright © 2019年 admin. All rights reserved.
//
#import "ViewController.h"
#import <YPSDK/YPSDX.h>


@interface ViewController()
    
    @property (nonatomic, strong) UITextField *txtUrl;
    @property (nonatomic, strong) UITextField *txtReUrl;
    
    @end

@implementation ViewController
    
    
- (instancetype)init
    {
        if (self = [super init]) {
            
        }
        return self;
    }
    
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initWindow];
    [self initUI];
}
    
- (void)initWindow
    {
        self.title = @"闪电匣SDK Demo";
        self.view.backgroundColor = [UIColor colorWithRed:64 green:35 blue:110 alpha:0];
    }
    
- (void)initUI
    {
        CGRect frame = [UIScreen mainScreen].bounds;
        
        CGFloat txtWidth = frame.size.width, txtHeight = 30, btnHeight = 50;
        _txtUrl = [[UITextField alloc] initWithFrame:CGRectMake(0,  (frame.size.height - btnHeight) / 2 - txtHeight * 3, txtWidth, txtHeight)];
        _txtUrl.backgroundColor = UIColor.lightGrayColor;
        _txtUrl.textColor = UIColor.blackColor;
        _txtUrl.clearButtonMode = UITextFieldViewModeAlways;
        _txtUrl.placeholder = @"此处输入url";
        [self.view addSubview:_txtUrl];
        
        _txtReUrl = [[UITextField alloc] initWithFrame:CGRectMake(0,  (frame.size.height - btnHeight) / 2 - txtHeight * 2 + 15, txtWidth, txtHeight)];
        _txtReUrl.backgroundColor = UIColor.lightGrayColor;
        _txtReUrl.textColor = UIColor.blackColor;
        _txtReUrl.clearButtonMode = UITextFieldViewModeAlways;
        _txtReUrl.placeholder = @"此处输入return url";
        [self.view addSubview:_txtReUrl];
        
        UIButton *inputBtn = [UIButton new];
        [inputBtn setTitle:@"隐藏输入法" forState:UIControlStateNormal];
        CGFloat btnWidth = 120;
        inputBtn.frame = CGRectMake( 20, (frame.size.height - btnHeight) / 2,btnWidth, btnHeight);
        [self.view addSubview:inputBtn];
        [inputBtn addTarget:self action:@selector(keyboardHide:) forControlEvents:UIControlEventTouchUpInside];
        
        UIButton *goBtn = [UIButton new];
        [goBtn setTitle:@"go" forState:UIControlStateNormal];
        goBtn.frame = CGRectMake( 150, (frame.size.height - btnHeight) / 2, btnWidth + 50, btnHeight);
        [self.view addSubview:goBtn];
        [goBtn addTarget:self action:@selector(go:) forControlEvents:UIControlEventTouchUpInside];
        
        UIButton *btn = [UIButton new];
        [btn setTitle:@"yunplus jsapi" forState:UIControlStateNormal];
        btn.frame = CGRectMake( (frame.size.width - btnWidth) / 2, (frame.size.height - btnHeight) / 2 + btnHeight * 2, btnWidth, btnHeight);
        [self.view addSubview:btn];
        [btn addTarget:self action:@selector(onButtonPress:) forControlEvents:UIControlEventTouchUpInside];
        
        UIButton *btn2 = [UIButton new];
        [btn2 setTitle:@"jiayoubao jsapi" forState:UIControlStateNormal];
        btn2.frame = CGRectMake( (frame.size.width - btnWidth) / 2, (frame.size.height - btnHeight) / 2 + btnHeight * 3, btnWidth, btnHeight);
        [self.view addSubview:btn2];
        [btn2 addTarget:self action:@selector(onButtonPress2:) forControlEvents:UIControlEventTouchUpInside];
    }
    
- (void)go:(id)button {
    [YPSDX actionWithURL: _txtUrl.text
               returnURL:_txtReUrl.text
              navigation:self.navigationController
                 success:^(NSDictionary *response) {
                     UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"成功"
                                                                                    message:@"return url invoke"
                                                                             preferredStyle:UIAlertControllerStyleAlert];
                     [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil]];
                     [self presentViewController:alert animated:true completion:nil];
                 } failure:^(NSDictionary *response, NSError *error) {
                     UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"失败"
                                                                                    message:@"return url invoke"
                                                                             preferredStyle:UIAlertControllerStyleAlert];
                     [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil]];
                     [self presentViewController:alert animated:true completion:nil];
                 }];
}
    
- (void)onButtonPress:(id)button {
    NSString *url = @"https://cdn-sdxsit.yunjiaplus.com/html/jsapi/index.html";
    [YPSDX actionWithUrl:url
               returnUrl:nil
              navigation:self.navigationController
              completion:^(NSDictionary *response) {
                  UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"成功"
                                                                                 message:@"return url invoke"
                                                                          preferredStyle:UIAlertControllerStyleAlert];
                  [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil]];
                  [self presentViewController:alert animated:true completion:nil];
              }];
}
    
- (void)onButtonPress2:(id)button {
    NSString *url = @"https://cdn-sdxsit.yunjiaplus.com/product/sdx/pay.html?token=05b4c2985ef2b78651f4cfe5f8cdac65&userid=623993&channel_id=100018&trade_no=201901091812380410&channel_type=Gi8tIhkqe3E=";
    [YPSDX actionWithUrl:url
               returnUrl:nil
              navigation:nil
              completion:nil];
}
    
- (void)keyboardHide:(id)btn
    {
        [self.view endEditing:YES];
    }
    
@end
