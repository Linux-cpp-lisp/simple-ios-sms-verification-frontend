//
//  SSVVerifyViewController.h
//  Simple SMS Verification
//
//  Created by A on 9/3/14.
//  Copyright (c) 2014 Toadbytes. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "UIAlertView+Blocks.h"

#define SERVER_ROOT @"ec2-54-164-170-108.compute-1.amazonaws.com"

@interface SSVVerifyViewController : UIViewController
- (IBAction)verifyPressed:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *codeField;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *verifyButton;
@property (weak, nonatomic) IBOutlet UILabel *shouldHaveRecivedLabel;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *workingIndicator;

@property NSString* phoneNumber;
@end
