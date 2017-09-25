//
//  PPViewController.m
//  PPScreenshotShare
//
//  Created by Vicky Hidayat on 09/20/2017.
//  Copyright (c) 2017 Vicky Hidayat. All rights reserved.
//

#import "PPViewController.h"

@interface PPViewController ()

@property (weak, nonatomic) IBOutlet UIWebView *web;

@end

@implementation PPViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    NSURL *url = [NSURL URLWithString:@"https://github.com/vickyhidayat/PPScreenshotShare"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [_web loadRequest:request];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
