//
//  NSString+LocaliziedString.m
//  JLQRCode
//
//  Created by Jason Li on 8/17/16.
//  Copyright © 2016 zrxd. All rights reserved.
//

#import "NSString+LocaliziedString.h"
#import "JLPreviewView.h"

@implementation NSString (LocaliziedString)

+ (NSString *)jl_LocaliziedStringForKey:(NSString *)key {
    NSString *bundleResourcePath = [NSBundle bundleForClass:[JLPreviewView class]].resourcePath;
    NSString *assetsPath = [bundleResourcePath stringByAppendingPathComponent:@"JLQRCodeAssets.bundle"];
    NSBundle *assetsBundle = [NSBundle bundleWithPath:assetsPath];
    if (assetsBundle) {
        return NSLocalizedStringFromTableInBundle(key, @"JLQRCodeLocalizable", assetsBundle, nil);
    }
    return key;
}


@end
