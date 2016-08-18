//
//  JLViewController.m
//  JLQRCode
//
//  Created by jason on 08/18/2016.
//  Copyright (c) 2016 jason. All rights reserved.
//

#import "JLViewController.h"
#import "JLQRCode.h"

@interface JLViewController ()
@property (nonatomic, strong) JLQRCodeScanViewController *scanVC;
@property (nonatomic, strong) JLQRCaptureViewController *captureVC;

@property (nonatomic, strong) UIButton *captureButton;
@property (nonatomic, strong) UITextView *textView;
@property (nonatomic, strong) UIButton *generateButton;

@property (nonatomic, strong) UIImageView *imgView;

@end

@implementation JLViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self.view addSubview:self.textView];
    [self.view addSubview:self.captureButton];
    [self.view addSubview:self.generateButton];
    [self.view addSubview:self.imgView];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    [self.textView setFrame:[self rectTextView]];
    [self.captureButton setFrame:[self rectCaputreButton]];
    [self.generateButton setFrame:[self rectGenerateButton]];
    [self.imgView setFrame:[self rectImageView]];
    
}

- (CGRect)rectTextView {
    CGRect rect = self.view.bounds;
    rect.origin.y = 64.f;
    rect.origin.x = 15.f;
    
    rect.size.height = rect.origin.y * 2.f;
    rect.size.width -= (rect.origin.x * 2.f);
    
    return rect;
}

- (CGRect)rectCaputreButton {
    CGRect rect = self.view.bounds;
    rect.origin.y = CGRectGetMaxY([self rectTextView]) + 20.f;
    rect.origin.x = 15.f;
    
    rect.size.height = 44.f;
    rect.size.width = (rect.size.width * .5f) - (rect.origin.x * 2.f);
    
    return rect;
}

- (CGRect)rectGenerateButton {
    CGRect rect = [self rectCaputreButton];
    rect.origin.x = CGRectGetMaxX(rect) + (CGRectGetMinX(rect) * 2.f);
    
    return rect;
}

- (CGFloat)heightForQRCodeView {
    CGFloat interval = 15.f;
    CGFloat width = ceilf(CGRectGetWidth(self.view.bounds) - (interval * 2.f));
    CGFloat height = ceilf(CGRectGetHeight(self.view.bounds) - CGRectGetMaxY([self rectCaputreButton]) - (interval * 2.f));
    return width > height?height:width;
}

- (CGFloat)heightForQRCode {
    return [self heightForQRCodeView] - 10.f;
}

- (CGRect)rectImageView {
    CGFloat height = ceilf(CGRectGetHeight(self.view.bounds) - CGRectGetMaxY([self rectCaputreButton]));
    
    CGRect rect = self.view.bounds;
    rect.size.height = [self heightForQRCodeView];
    rect.size.width = rect.size.height;
    
    rect.origin.x = (CGRectGetWidth(self.view.bounds) - CGRectGetWidth(rect)) * 0.5f;
    rect.origin.y = ((height - CGRectGetHeight(rect)) * 0.5f) + CGRectGetMaxY([self rectCaputreButton]);
    
    return rect;
    
}

#pragma mark - Action
- (void)actionToOperCaptureButton {
    [self.imgView setHidden:YES];
    __weak typeof(self) weakSelf = self;
    self.captureVC = [JLQRCaptureViewController QRCapturePresentController:self withTitle:@"Scan QRCode" captureCompletion:^(NSString *codeString, BOOL isQRCode) {
        if (isQRCode) {
            weakSelf.textView.text = codeString;
        }
    }];
}

- (void)actionToOperGenerateButton {
    [self.view endEditing:YES];
    if (self.textView.text.length == 0) {
        [self.textView becomeFirstResponder];
        return;
    }
    
    [self.imgView setHidden:NO];
    UIImage *qrImage = [UIImage jl_QRCodeForString:self.textView.text size:[self heightForQRCode] fillColor:[UIColor darkGrayColor]];
    [self.imgView setImage:qrImage];
}

#pragma mark - Getter And Setter
- (JLQRCodeScanViewController *)scanVC {
    if (_scanVC) return _scanVC;
    _scanVC = [[JLQRCodeScanViewController alloc] init];
    
    return _scanVC;
}

- (UITextView *)textView {
    if (_textView) return _textView;
    _textView = [[UITextView alloc] init];
    _textView.text = @"will show capture QRCode string.";
    
    _textView.layer.borderColor = [UIColor blackColor].CGColor;
    _textView.layer.borderWidth = 0.5f;
    _textView.layer.cornerRadius = 4.f;
    
    return _textView;
}

- (UIButton *)captureButton {
    if (_captureButton) return _captureButton;
    _captureButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [_captureButton setTitle:@"Capture" forState:UIControlStateNormal];
    
    _captureButton.layer.borderColor = [UIColor blackColor].CGColor;
    _captureButton.layer.borderWidth = 0.5f;
    _captureButton.layer.cornerRadius = 4.f;
    
    [_captureButton addTarget:self action:@selector(actionToOperCaptureButton) forControlEvents:UIControlEventTouchUpInside];
    
    return _captureButton;
}

- (UIButton *)generateButton {
    if (_generateButton) return _generateButton;
    _generateButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [_generateButton setTitle:@"Generate" forState:UIControlStateNormal];
    
    _generateButton.layer.borderColor = [UIColor blackColor].CGColor;
    _generateButton.layer.borderWidth = 0.5f;
    _generateButton.layer.cornerRadius = 4.f;
    
    [_generateButton addTarget:self action:@selector(actionToOperGenerateButton) forControlEvents:UIControlEventTouchUpInside];
    
    return _generateButton;
}

- (UIImageView *)imgView {
    if (_imgView) return _imgView;
    _imgView = [[UIImageView alloc] initWithFrame:[self rectImageView]];
    _imgView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    
    [_imgView setHidden:YES];
    
    return _imgView;
}


@end
