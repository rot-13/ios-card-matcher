//
//  CMHViewController.m
//  CardMatcher
//
//  Created by Gilad Goldberg on 9/17/14.
//  Copyright (c) 2014 IIC. All rights reserved.
//

#import "CMHViewController.h"
#import <opencv2/highgui/cap_ios.h>
#include "Video Source/VideoSource.h"


@interface CMHViewController () <VideoSourceDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *mImageView;
@property (weak, nonatomic) IBOutlet UIButton *mGoButton;

@property (strong, nonatomic) VideoSource* videoSource;


@end

@implementation CMHViewController


- (void)viewDidLoad
{
  [super viewDidLoad];
  
  // Configure Video Source
  self.videoSource = [[VideoSource alloc] init];
  self.videoSource.delegate = self;
  [self.videoSource startWithDevicePosition:AVCaptureDevicePositionBack];

}

#pragma mark -
#pragma mark VideoSource Delegate
- (void)frameReady:(VideoFrame)frame {
  __weak CMHViewController *_weakSelf = self;
  dispatch_sync( dispatch_get_main_queue(), ^{
    // Construct CGContextRef from VideoFrame
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGContextRef newContext = CGBitmapContextCreate(frame.data,
                                                    frame.width,
                                                    frame.height,
                                                    8,
                                                    frame.stride,
                                                    colorSpace,
                                                    kCGBitmapByteOrder32Little |
                                                    kCGImageAlphaPremultipliedFirst);
    
    // Construct CGImageRef from CGContextRef
    CGImageRef newImage = CGBitmapContextCreateImage(newContext);
    CGContextRelease(newContext);
    CGColorSpaceRelease(colorSpace);
    
    // Construct UIImage from CGImageRef
    UIImage * image = [UIImage imageWithCGImage:newImage];
    CGImageRelease(newImage);
    [[_weakSelf mImageView] setImage:image];
  });
}


@end
