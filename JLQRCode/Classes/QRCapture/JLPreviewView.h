//
//  JLPreviewView.h
//  JLQRCode
//
//  Created by Jason Li on 8/17/16.
//  Copyright © 2016 zrxd. All rights reserved.
//

#import <UIKit/UIKit.h>

#define fillEdgeInsets UIEdgeInsetsMake(10, 10, 10, 10)
#define borderEdgeInsets UIEdgeInsetsMake(15, 15, 15, 15)

#define fillColor [[UIColor alloc] initWithWhite:0.0f alpha:0.4]
#define borderColor [UIColor greenColor]
#define scanColor [UIColor redColor]
#define keyLineWidth 1.0f

@interface JLPreviewView : UIView

- (CGRect)previewRect;
- (CGRect)previewRectOfInterest;

@end
