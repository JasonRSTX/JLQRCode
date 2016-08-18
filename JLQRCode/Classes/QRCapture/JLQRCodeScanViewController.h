//
//  JLQRCodeScanViewController.h
//  JLQRCode
//
//  Created by Jason Li on 8/17/16.
//  Copyright © 2016 zrxd. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^JLQRCaptureCompletion)(NSString *codeString, BOOL isQRCode);

@interface JLQRCodeScanViewController : UIViewController
@property (nonatomic, copy) JLQRCaptureCompletion blockCompletion;

- (void)startRunning;
- (void)stopRunning;

@end
