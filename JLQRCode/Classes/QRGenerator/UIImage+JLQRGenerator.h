//
//  UIImage+JLQRGenerator.h
//  JLQRCode
//
//  Created by Jason Li on 8/18/16.
//  Copyright © 2016 zrxd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (JLQRGenerator)

+ (UIImage *)jl_QRCodeForString:(NSString *)qrString size:(CGFloat)size;
+ (UIImage *)jl_QRCodeForString:(NSString *)qrString size:(CGFloat)size fillColor:(UIColor *)fillColor;

@end
