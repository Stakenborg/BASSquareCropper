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
}

- (void)showCropper
{
    UIImage *imageToCrop = [UIImage imageNamed:@"test-image"];
    BASSquareCropperViewController *squareCropperViewController = [[BASSquareCropperViewController alloc] initWithImage:imageToCrop minimumCroppedImageWidthHeight:200.0f];
    squareCropperViewController.squareCropperDelegate = self;
/*  Use these settings to play with the layout
    squareCropperViewController.backgroundColor = [UIColor whiteColor];
    squareCropperViewController.borderColor = [UIColor redColor];
    squareCropperViewController.doneColor = [UIColor blackColor];
    squareCropperViewController.doneFont = [UIFont fontWithName:@"Avenir-Roman" size:30.0f];
    squareCropperViewController.doneText = @"FINISHED";
    squareCropperViewController.excludedBackgroundColor = [UIColor blueColor]; 
 */
    [self presentViewController:squareCropperViewController animated:YES completion:nil];
}

- (void)squareCropperDidCropImage:(UIImage *)croppedImage
{
    [self dismissViewControllerAnimated:YES completion:nil];
    self.imageView.image = croppedImage;
}

@end
