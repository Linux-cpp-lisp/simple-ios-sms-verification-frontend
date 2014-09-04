//
//  SSVViewController.m
//  Simple SMS Verification
//
//  Created by A on 9/3/14.
//  Copyright (c) 2014 Toadbytes. All rights reserved.
//

#import "SSVViewController.h"

@interface SSVViewController ()

@end

@implementation SSVViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

-(void)viewWillAppear:(BOOL)animated {
    [self.phoneTextField becomeFirstResponder];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if([segue.identifier isEqualToString:@"nextSegue"]) {
        SSVVerifyViewController* vc = (SSVVerifyViewController*)segue.destinationViewController;
        vc.phoneNumber = self.phoneTextField.text;
    }
}

-(void)viewDidDisappear:(BOOL)animated {
    self.phoneTextField.text = @"";
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
