//
//  ShowImageTool.m
//  CheckImageDemo
//
//  Created by a on 2019/12/2.
//  Copyright © 2019 TeenageBeaconFireGroup. All rights reserved.
//

#import "ShowImageTool.h"
#import "SavePhotoInSystemAlum.h"
@interface ShowImageTool ()
//存储 被展示 imageView 的 image
@property (nonatomic,strong) UIImageView * showImageView;
@end
@implementation ShowImageTool

+ (ShowImageTool *)showImageTool
{
    static ShowImageTool * showImageTool = nil;
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        showImageTool = [[ShowImageTool alloc] init];
    });
    return showImageTool;
}

-(void)initDefaultImage:(UIImage *)showImage originRect:(CGRect)originRect{
    self.showImageView.image = showImage;
    self.originRect = originRect;
}
-(void)animationMoveFromRect:(CGRect)startRect toRect:(CGRect)endRect isDismiss:(BOOL)isDismiss{
    self.showImageView.frame = startRect;
    [UIView animateKeyframesWithDuration:0.2 delay:0.0 options:UIViewKeyframeAnimationOptionLayoutSubviews animations:^{
        if (!isDismiss) {
            //展示：
            UIWindow* window = [UIApplication sharedApplication].windows.firstObject;
            [window addSubview:self.showImageView];
        }
        self.showImageView.frame = endRect;
    } completion:^(BOOL finished) {
        if (isDismiss) {
            //消失：
            [self.showImageView removeFromSuperview];
        }
    }];
}
-(UIImageView *)showImageView{
    if (!_showImageView) {
        _showImageView = [[UIImageView alloc]initWithFrame:CGRectZero];
        _showImageView.userInteractionEnabled = YES;
        _showImageView.contentMode = UIViewContentModeScaleAspectFit;
        _showImageView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.5];
    
        UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(didDismissImageAction:)];
        [_showImageView addGestureRecognizer:tap];
        
        UILongPressGestureRecognizer * longPress = [[UILongPressGestureRecognizer alloc]initWithTarget:self action:@selector(didSaveImageAction:)];
        [_showImageView addGestureRecognizer:longPress];
    }
    return _showImageView;
}

-(void)didSaveImageAction:(UILongPressGestureRecognizer *)longPress{
    if (longPress.state != UIGestureRecognizerStateBegan) {
        return;
    }
    [[SavePhotoInSystemAlum sharedOtherFaceDeal] didSavePhotoAlumSheetWithImage:self.showImageView.image];
}
//图片消失
-(void)didDismissImageAction:(UIGestureRecognizer*)gestureRecognizer{
    [self animationMoveFromRect:[UIScreen mainScreen].bounds toRect:self.originRect isDismiss:YES];
}
@end
