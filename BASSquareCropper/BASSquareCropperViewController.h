//
//  BASSquareCropperViewController.h
//  BASSquareCropperExample
//
//  Created by Brandon Stakenborg on 5/14/14.
//  Copyright (c) 2014 Brandon Stakenborg. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol BASSquareCropperDelegate <NSObject>

- (void)squareCropperDidCropImage:(UIImage *)croppedImage;
- (void)squareCropperDidCancelCrop;

@end

@interface BASSquareCropperViewController : UIViewController

@property (nonatomic, strong) UIColor  *backgroundColor;
@property (nonatomic, strong) UIColor  *borderColor;
@property (nonatomic, strong) UIColor  *excludedBackgroundColor;
@property (nonatomic, strong) UIFont   *doneFont;
@property (nonatomic, strong) UIColor  *doneColor;
@property (nonatomic, copy)   NSString *doneText;
@property (nonatomic, strong) UIFont   *cancelFont;
@property (nonatomic, strong) UIColor  *cancelColor;
@property (nonatomic, copy)   NSString *cancelText;
@property (nonatomic, assign) id<BASSquareCropperDelegate>squareCropperDelegate;

- (instancetype)initWithImage:(UIImage *)image minimumCroppedImageSideLength:(CGFloat)minimumCroppedImageSideLength;

@end
