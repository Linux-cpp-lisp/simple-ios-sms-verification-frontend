//
//  UIAlertView+Blocks.h
//  Musicthat
//
//  Created by A on 9/30/13.
//  Copyright (c) 2013 A. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIAlertView (Blocks)
+ (void)presentWithTitle:(NSString *)title
                 message:(NSString *)message
                 buttons:(NSArray *)buttons
           buttonHandler:(void(^)(NSUInteger index))handler;
@end
