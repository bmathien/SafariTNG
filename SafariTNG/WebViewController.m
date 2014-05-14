//
//  ViewController.m
//  SafariTNG
//
//  Created by teacher on 5/14/14.
//  Copyright (c) 2014 Mathien. All rights reserved.
//

#import "WebViewController.h"

@interface WebViewController () <UIWebViewDelegate, UITextFieldDelegate, UIAlertViewDelegate>
//be sure to add delegate above 
@property (strong, nonatomic) IBOutlet UIWebView *myWebView;
@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *spinner;

@end

@implementation WebViewController


// Adding a webview with web page
- (void)viewDidLoad
{
    [super viewDidLoad];
    [self goToUrlString:@"http://mobilemakers.co"];
}

- (void)webViewDidStartLoad:(UIWebView *)webView
{
    [self.spinner startAnimating];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    [self.spinner stopAnimating];
}


/// did not load message coding
//adding second go home button
- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    UIAlertView *alert = [[UIAlertView alloc] init];
    alert.title = @"loading failed";
    alert.message = error.localizedDescription;
    [alert addButtonWithTitle:@"ok, thanks anyway."];
    [alert addButtonWithTitle:@"go home"];
    alert.delegate = self;
    [alert show];
    [self.spinner stopAnimating];
}

// what happens when you hit go home button
- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 1)
    {
        [self goToUrlString:@"http://mobilemakers.co"];
    }
}


// if you are repeating multiple code lines, dry method. Create a method  to reuse
//     [self goToUrlString:@"http://mobilemakers.co"];

- (void)goToUrlString:(NSString *)urlString
{
    NSURL *url = [NSURL URLWithString:urlString];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [self.myWebView loadRequest:request];

}

// Adding a textview with web page
// also uses the hider method     [self goToUrlString:textField.text];

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self goToUrlString:textField.text];


    [textField resignFirstResponder];

    return YES;
}
@end
