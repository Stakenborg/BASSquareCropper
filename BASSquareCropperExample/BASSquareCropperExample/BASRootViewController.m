//
//  BASRootViewController.m
//  BASSquareCropperExample
//
//  Created by Brandon Stakenborg on 5/14/14.
//  Copyright (c) 2014 Brandon Stakenborg. All rights reserved.
//

#import "BASRootViewController.h"
#import "BASSquareCropperViewController.h"

@interface BASRootViewController () <BASSquareCropperDelegate>

@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UILabel *sizeLabel;

@end

@implementation BASRootViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.frame = CGRectMake(20, 20, 280, 44);
    [button setTitle:@"Show Cropper" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(showCropper) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    self.imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 80, 320, 320)];
    [self.view addSubview:self.imageView];
    
    self.sizeLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 410, 320, 20)];
    self.sizeLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:self.sizeLabel];
}

- (void)showCropper
{
    UIImage *imageToCrop = [UIImage imageNamed:@"test-image"];
    BASSquareCropperViewController *squareCropperViewController = [[BASSquareCropperViewController alloc] initWithImage:imageToCrop minimumCroppedImageSideLength:400.0f];
    squareCropperViewController.squareCropperDelegate = self;
/*  Use these settings to play with the layout
    squareCropperViewController.backgroundColor = [UIColor whiteColor];
    squareCropperViewController.borderColor = [UIColor redColor];
    squareCropperViewController.doneColor = [UIColor orangeColor];
    squareCropperViewController.doneFont = [UIFont fontWithName:@"Avenir-Roman" size:30.0f];
    squareCropperViewController.doneText = @"FINISHED";
    squareCropperViewController.cancelColor = [UIColor greenColor];
    squareCropperViewController.cancelFont = [UIFont fontWithName:@"Avenir-Black" size:25.0f];
    squareCropperViewController.cancelText = @"STOP";
    squareCropperViewController.excludedBackgroundColor = [UIColor blackColor];
 */
    [self presentViewController:squareCropperViewController animated:YES completion:nil];
}

- (void)squareCropperDidCropImage:(UIImage *)croppedImage inCropper:(BASSquareCropperViewController *)cropper
{
    self.sizeLabel.text = NSStringFromCGRect(cropper.cropRect);
    self.imageView.image = croppedImage;
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)squareCropperDidCancelCropInCropper:(BASSquareCropperViewController *)cropper
{
    self.sizeLabel.text = nil;
    self.imageView.image = nil;
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
