//
//  JLPreviewView.m
//  JLQRCode
//
//  Created by Jason Li on 8/17/16.
//  Copyright © 2016 zrxd. All rights reserved.
//

#import "JLPreviewView.h"

@implementation JLPreviewView
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

- (CGRect)previewRect {
    CGRect scanRect = CGRectZero;
    scanRect.size.width = CGRectGetWidth(self.bounds) - fillEdgeInsets.left - fillEdgeInsets.right - borderEdgeInsets.left - borderEdgeInsets.right;
    scanRect.size.height = scanRect.size.width;
    scanRect.origin.x = fillEdgeInsets.left + borderEdgeInsets.left;
    scanRect.origin.y = (CGRectGetHeight(self.bounds) - CGRectGetHeight(scanRect))/2.f;
    
    return scanRect;
}

- (CGRect)previewRectOfInterest {
    CGRect scanRect = [self previewRect];
    CGRect interest = CGRectZero;
    interest.origin.x = (scanRect.origin.y - 10)/CGRectGetHeight(self.bounds);
    interest.origin.y = (scanRect.origin.x - 10)/CGRectGetWidth(self.bounds);
    interest.size.width = (scanRect.size.width + 10)/CGRectGetHeight(self.bounds);
    interest.size.height = (scanRect.size.height + 10)/CGRectGetWidth(self.bounds);
    
    return interest;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    [super drawRect:rect];
    
    // Drawing code
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(ctx, fillColor.CGColor);
    CGContextFillRect(ctx, self.bounds);
    
    CGRect clearRect = CGRectZero;
    clearRect.size.width = CGRectGetWidth(rect) - fillEdgeInsets.left - fillEdgeInsets.right;
    clearRect.size.height = clearRect.size.width;
    clearRect.origin.x = fillEdgeInsets.left;
    clearRect.origin.y = (CGRectGetHeight(rect) - CGRectGetHeight(clearRect))/2;
    
    CGContextClearRect(ctx, clearRect);
    
    //Drawing Border
    CGContextSetLineWidth(ctx, keyLineWidth);//制定了线的宽度
    CGContextSetStrokeColorWithColor(ctx, borderColor.CGColor);
    
    CGPoint startPoint = CGPointMake(CGRectGetMinX(clearRect) + borderEdgeInsets.left, CGRectGetMinY(clearRect) + (3*borderEdgeInsets.top));
    CGPoint endPoint = CGPointMake(startPoint.x, CGRectGetMinY(clearRect) + borderEdgeInsets.top);
    CGContextMoveToPoint(ctx, startPoint.x, startPoint.y);
    CGContextAddLineToPoint(ctx, endPoint.x, endPoint.y);
    CGContextStrokePath(ctx);
    
    startPoint = endPoint;
    endPoint = CGPointMake(CGRectGetMinX(clearRect) + (3*borderEdgeInsets.left), startPoint.y);
    CGContextMoveToPoint(ctx, startPoint.x, startPoint.y);
    CGContextAddLineToPoint(ctx, endPoint.x, endPoint.y);
    CGContextStrokePath(ctx);
    
    startPoint = CGPointMake(CGRectGetMaxX(clearRect) - (3*borderEdgeInsets.left), CGRectGetMinY(clearRect) + borderEdgeInsets.top);
    endPoint = CGPointMake(CGRectGetMaxX(clearRect) - borderEdgeInsets.left, startPoint.y);
    CGContextMoveToPoint(ctx, startPoint.x, startPoint.y);
    CGContextAddLineToPoint(ctx, endPoint.x, endPoint.y);
    CGContextStrokePath(ctx);
    
    startPoint = endPoint;
    endPoint = CGPointMake(startPoint.x, CGRectGetMinY(clearRect) + (3*borderEdgeInsets.top));
    CGContextMoveToPoint(ctx, startPoint.x, startPoint.y);
    CGContextAddLineToPoint(ctx, endPoint.x, endPoint.y);
    CGContextStrokePath(ctx);
    
    startPoint = CGPointMake(CGRectGetMaxX(clearRect) - borderEdgeInsets.left, CGRectGetMaxY(clearRect) - (3*borderEdgeInsets.top));
    endPoint = CGPointMake(startPoint.x, CGRectGetMaxY(clearRect) - borderEdgeInsets.top);
    CGContextMoveToPoint(ctx, startPoint.x, startPoint.y);
    CGContextAddLineToPoint(ctx, endPoint.x, endPoint.y);
    CGContextStrokePath(ctx);
    
    startPoint = endPoint;
    endPoint = CGPointMake(CGRectGetMaxX(clearRect) - (3*borderEdgeInsets.left), startPoint.y);
    CGContextMoveToPoint(ctx, startPoint.x, startPoint.y);
    CGContextAddLineToPoint(ctx, endPoint.x, endPoint.y);
    CGContextStrokePath(ctx);
    
    startPoint = CGPointMake(CGRectGetMinX(clearRect) + (3*borderEdgeInsets.left), CGRectGetMaxY(clearRect) - borderEdgeInsets.top);
    endPoint = CGPointMake(CGRectGetMinX(clearRect) + borderEdgeInsets.left, startPoint.y);
    CGContextMoveToPoint(ctx, startPoint.x, startPoint.y);
    CGContextAddLineToPoint(ctx, endPoint.x, endPoint.y);
    CGContextStrokePath(ctx);
    
    startPoint = endPoint;
    endPoint = CGPointMake(startPoint.x, CGRectGetMaxY(clearRect) - (3*borderEdgeInsets.top));
    CGContextMoveToPoint(ctx, startPoint.x, startPoint.y);
    CGContextAddLineToPoint(ctx, endPoint.x, endPoint.y);
    CGContextStrokePath(ctx);
    
    //Drawing Scan
    CGContextSetLineWidth(ctx, keyLineWidth);//制定了线的宽度
    CGContextSetStrokeColorWithColor(ctx, scanColor.CGColor);
    
    startPoint = CGPointMake(CGRectGetMinX(clearRect) + borderEdgeInsets.left, CGRectGetMidY(clearRect));
    endPoint = CGPointMake(CGRectGetMaxX(clearRect) - borderEdgeInsets.left, startPoint.y);
    CGContextMoveToPoint(ctx, startPoint.x, startPoint.y);
    CGContextAddLineToPoint(ctx, endPoint.x, endPoint.y);
    CGContextStrokePath(ctx);
    
}

@end
