//
//  UIImage+ResizeImage.m
//  Departures
//
//  Created by Departures on 5/6/16.
//  Copyright © 2016 Departures. All rights reserved.
//

#import "UIImage+ResizeImage.h"

@implementation UIImage (ResizeImage)
//拉伸气泡图片
+(UIImage *) resizeWithImageName:(NSString *)name{
    UIImage *image = [UIImage imageNamed:name];
    CGFloat width  = image.size.width*0.5f  - 1;
    CGFloat height = image.size.height*0.5f - 1;
    UIImage *resizeImage = [image resizableImageWithCapInsets:UIEdgeInsetsMake(height, width, height, width)];//For iOS 5.0 and later
    //    [image resizableImageWithCapInsets:<#(UIEdgeInsets)#> resizingMode:<#(UIImageResizingMode)#>] For iOS 6.0 and  later
    //    [image stretchableImageWithLeftCapWidth:<#(NSInteger)#> topCapHeight:<#(NSInteger)#>] For iOS 5.0 and later
    return resizeImage;
}

@end
