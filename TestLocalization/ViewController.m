//
//  ViewController.m
//  TestLocalization
//
//  Created by Jamin on 8/13/13.
//  Copyright (c) 2013 tencent. All rights reserved.
//

#import "ViewController.h"
#import <MessageUI/MessageUI.h>

@interface ViewController () <MFMailComposeViewControllerDelegate>

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.

    UIImageView * backgroundView = [[UIImageView alloc] initWithFrame:self.view.bounds];
    backgroundView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    backgroundView.contentMode = UIViewContentModeScaleAspectFill;
    backgroundView.image = [UIImage imageNamed:@"unbrella.jpg"];
    [self.view addSubview:backgroundView];

    UILabel * currentLanguageLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 120, self.view.bounds.size.width, 30)];
    currentLanguageLabel.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleBottomMargin;
    currentLanguageLabel.backgroundColor = [UIColor clearColor];
    currentLanguageLabel.textAlignment = NSTextAlignmentCenter;
    currentLanguageLabel.font = [UIFont boldSystemFontOfSize:24];
    currentLanguageLabel.text = NSLocalizedString(@"Language", @"Current Language");
    [self.view addSubview:currentLanguageLabel];


    UILabel * helloLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 160, self.view.bounds.size.width, 30)];
    helloLabel.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleBottomMargin;
    helloLabel.backgroundColor = [UIColor clearColor];
    helloLabel.textAlignment = NSTextAlignmentCenter;
    helloLabel.font = [UIFont systemFontOfSize:18];
    helloLabel.text = NSLocalizedString(@"Hello!", @"Say Hello");
    [self.view addSubview:helloLabel];


    UILabel * hello2Label = [[UILabel alloc] initWithFrame:CGRectMake(0, 180, self.view.bounds.size.width, 30)];
    hello2Label.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleBottomMargin;
    hello2Label.backgroundColor = [UIColor clearColor];
    hello2Label.textAlignment = NSTextAlignmentCenter;
    hello2Label.font = [UIFont systemFontOfSize:18];
    hello2Label.text = NSLocalizedString(@"Hello!", @"Say Hello Twice");
    [self.view addSubview:hello2Label];

    UIButton * shareButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    shareButton.frame = CGRectMake((self.view.bounds.size.width - 80)/2, 220, 80, 40);
    [shareButton setTitle:NSLocalizedString(@"Share", @"Share") forState:UIControlStateNormal];
    [shareButton addTarget:self action:@selector(shareAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:shareButton];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Action
- (void)shareAction:(UIButton *)button
{
    if ([MFMailComposeViewController canSendMail]) {
        MFMailComposeViewController * mailViewController = [[MFMailComposeViewController alloc] init];
        mailViewController.mailComposeDelegate = self;
        [self presentModalViewController:mailViewController animated:YES];
    }
}


#pragma mark - MFMailComposeViewControllerDelegate
- (void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error
{
    [self dismissViewControllerAnimated:YES completion:nil];
}


@end
