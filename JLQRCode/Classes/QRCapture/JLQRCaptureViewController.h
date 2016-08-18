//
//  JLQRCaptureViewController.h
//  JLQRCode
//
//  Created by Jason Li on 8/17/16.
//  Copyright © 2016 zrxd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JLQRCaptureViewController : UIViewController

+ (instancetype)QRCapturePresentController:(UIViewController *)viewController
                                 withTitle:(NSString *)title
                         captureCompletion:(void (^)(NSString *codeString, BOOL isQRCode))completion;

@end
