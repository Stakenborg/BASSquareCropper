BASSquareCropper
================

A simple, customizable square scale and crop view controller

<img style="float:left" src="https://github.com/Stakenborg/BASSquareCropper/raw/master/croppingscreenshot.png" width="320" height="480" />
<img style="float:right" src="https://github.com/Stakenborg/BASSquareCropper/raw/master/croppedscreenshot.png" width="320" height="480" />

##Usage

Simply import the cropper with `#import BASSquareCropperViewController.h`

Listen to the following delegate methods:
* `- (void)squareCropperDidCropImage:(UIImage *)croppedImage`
* `- (void)squareCropperDidCancelCrop`

and handle them according to how your app should function.

Initialize the cropper with an image and a minimum side length as so (0.0f side length means no limit):
`BASSquareCropperViewController *squareCropperViewController = [[BASSquareCropperViewController alloc] initWithImage:imageToCrop minimumCroppedImageSideLength:200.0f];`

Don't forget to set the delegate! `squareCropperViewController.squareCropperDelegate = self;`

From here, it's recommended to present this view controller modally, but not required.

##Customization

The following properties can be set to adjust the look and feel of the cropper:
```
@property (nonatomic, strong) UIColor  *backgroundColor;
@property (nonatomic, strong) UIColor  *borderColor;
@property (nonatomic, strong) UIColor  *excludedBackgroundColor;
@property (nonatomic, strong) UIFont   *doneFont;
@property (nonatomic, strong) UIColor  *doneColor;
@property (nonatomic, copy)   NSString *doneText;
@property (nonatomic, strong) UIFont   *cancelFont;
@property (nonatomic, strong) UIColor  *cancelColor;
@property (nonatomic, copy)   NSString *cancelText;
```
Simply initialize the cropper and set whichever of these as is fitting, for example:
```
squareCropperViewController.backgroundColor = [UIColor whiteColor];
squareCropperViewController.borderColor = [UIColor redColor];
squareCropperViewController.doneColor = [UIColor orangeColor];
squareCropperViewController.doneFont = [UIFont fontWithName:@"Avenir-Roman" size:30.0f];
squareCropperViewController.doneText = @"FINISHED";
squareCropperViewController.cancelColor = [UIColor greenColor];
squareCropperViewController.cancelFont = [UIFont fontWithName:@"Avenir-Black" size:25.0f];
squareCropperViewController.cancelText = @"STOP";
squareCropperViewController.excludedBackgroundColor = [UIColor blackColor];
```
This would look like hot garbage, but you get the idea.

##License
BASSquareCropperController is available under the MIT license.
