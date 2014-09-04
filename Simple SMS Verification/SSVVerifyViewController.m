//
//  SSVVerifyViewController.m
//  Simple SMS Verification
//
//  Created by A on 9/3/14.
//  Copyright (c) 2014 Toadbytes. All rights reserved.
//

#import "SSVVerifyViewController.h"

@interface SSVVerifyViewController ()

@end

@implementation SSVVerifyViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationItem.hidesBackButton = YES;
    // Do any additional setup after loading the view.
}

-(void)viewDidAppear:(BOOL)animated {
    [self startRequest];
}

-(void)startRequest {
    NSURL* url = [NSURL URLWithString:[NSString stringWithFormat:@"http://%@/verifier/send-code?phone_number=%@", SERVER_ROOT, self.phoneNumber]];
    NSURLSessionDataTask* dataTask = [[NSURLSession sharedSession] dataTaskWithURL:url completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        dispatch_async(dispatch_get_main_queue(), ^() {
            if(error != nil) {
                [UIAlertView presentWithTitle:@"Error" message:[NSString stringWithFormat:@"An error occured: %@", error.localizedDescription] buttons:@[@"OK"] buttonHandler:^(NSUInteger index) {
                    [self.navigationController popToRootViewControllerAnimated:YES];
                }];
            }
            else if([(NSHTTPURLResponse*)response statusCode] != 200) {
                [UIAlertView presentWithTitle:@"Error" message:[[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding] buttons:@[@"OK"] buttonHandler:^(NSUInteger index) {
                    [self.navigationController popToRootViewControllerAnimated:YES];
                }];
            }
            else {
                self.verifyButton.enabled = YES;
                self.shouldHaveRecivedLabel.hidden = NO;
                self.codeField.enabled = YES;
                self.workingIndicator.hidden = YES;
            }
        });
    }];
    [dataTask resume];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)verifyPressed:(id)sender {
    NSURL* url = [NSURL URLWithString:[NSString stringWithFormat:@"http://%@/verifier/check-code?phone_number=%@&code=%@", SERVER_ROOT, self.phoneNumber, self.codeField.text]];
    NSURLSessionDataTask* dataTask = [[NSURLSession sharedSession] dataTaskWithURL:url completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        dispatch_async(dispatch_get_main_queue(), ^() {
            if(error != nil) {
                [UIAlertView presentWithTitle:@"Error" message:[NSString stringWithFormat:@"An error occured: %@", error.localizedDescription] buttons:@[@"OK"] buttonHandler:^(NSUInteger index) {
                    [self.navigationController popToRootViewControllerAnimated:YES];
                }];
            }
            else if([(NSHTTPURLResponse*)response statusCode] != 200) {
                [UIAlertView presentWithTitle:@"Error" message:[[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding] buttons:@[@"OK"] buttonHandler:^(NSUInteger index) {
                    [self.navigationController popToRootViewControllerAnimated:YES];
                }];
            }
            else {
                [UIAlertView presentWithTitle:[[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding] message:@"" buttons:@[@"OK"] buttonHandler:^(NSUInteger index) {
                    [self.navigationController popToRootViewControllerAnimated:YES];
                }];
            }
        });
    }];
    self.shouldHaveRecivedLabel.hidden = YES;
    self.workingIndicator.hidden = NO;
    self.verifyButton.enabled = NO;
    self.codeField.enabled = NO;
    [dataTask resume];
}
@end
