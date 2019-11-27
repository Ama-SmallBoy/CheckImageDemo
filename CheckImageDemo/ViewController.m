//
//  ViewController.m
//  CheckImageDemo
//
//  Created by a on 2019/11/27.
//  Copyright © 2019 TeenageBeaconFireGroup. All rights reserved.
//

#import "ViewController.h"
#import "ImageCheckController.h"
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imgView;
//存储 被展示 imageView 的 image
@property (nonatomic,strong) UIImageView * showImageView;
//存储 被展示 imageView 的  最初尺寸
@property (nonatomic,assign) CGRect originRect;




@property (weak, nonatomic) IBOutlet UIView *greenView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
#pragma mark------ 获取 imgView 在 self.view 中 的 frame 的 三种方法
    
    //TODO:将 self.imgView 在 self.greenView 中的frame 转换成 在self.view 中的frame
    
    //TODO:第一种：分步骤完成
    //1.首先获取 self.imgView 在 self.imgView 中的位置
    CGRect imgGreenRect = [self.imgView convertRect:self.imgView.frame fromView:self.greenView];
    NSLog(@"==========%@",NSStringFromCGRect(imgGreenRect));
    //2.将self.imgView 在 self.imgView 的坐标 转化成 在 self.view 中的frame
    CGRect imgVCRect = [self.imgView convertRect:imgGreenRect toView:self.view];
    NSLog(@"==========%@",NSStringFromCGRect(imgVCRect));
    
    //TODO:第二种：使用 convertRect:toView: 方法获取
    CGRect imgVCRect1 = [self.greenView convertRect:self.imgView.frame toView:self.view];
    NSLog(@"==========%@",NSStringFromCGRect(imgVCRect1));
    
    //TODO:第三种：使用 convertRect:fromView: 方法获取
    CGRect imgVCRect2 = [self.view convertRect:self.imgView.frame fromView:self.greenView];
    NSLog(@"==========%@",NSStringFromCGRect(imgVCRect2));
    
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(didShowImageAction:)];
    [self.imgView addGestureRecognizer:tap];
    
    //保留图片相对于 self.view 的 尺寸
    self.originRect = imgVCRect2;
    self.showImageView.image = self.imgView.image;
}

-(void)animationMoveFromRect:(CGRect)startRect toRect:(CGRect)endRect isDismiss:(BOOL)isDismiss{
    self.showImageView.frame = startRect;
    [UIView animateKeyframesWithDuration:0.2 delay:0.1 options:UIViewKeyframeAnimationOptionLayoutSubviews animations:^{
        if (isDismiss) {
            //展示：
            UIWindow* window = [UIApplication sharedApplication].windows.firstObject;
            [window addSubview:self.showImageView];
        }
        self.showImageView.frame = endRect;
    } completion:^(BOOL finished) {
        if (!isDismiss) {
            //展示：
            [self.showImageView removeFromSuperview];
        }
    }];
}
-(UIImageView *)showImageView{
    if (!_showImageView) {
        _showImageView = [[UIImageView alloc]initWithFrame:CGRectZero];
        _showImageView.userInteractionEnabled = YES;
        _showImageView.contentMode = UIViewContentModeScaleAspectFit;
        UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(didDismissImageAction:)];
        [_showImageView addGestureRecognizer:tap];
    }
    return _showImageView;
}
//图片展示
-(void)didShowImageAction:(UIGestureRecognizer*)gestureRecognizer{
   [self animationMoveFromRect:self.originRect toRect:[UIScreen mainScreen].bounds isDismiss:YES];
}
//图片消失
-(void)didDismissImageAction:(UIGestureRecognizer*)gestureRecognizer{
    [self animationMoveFromRect:[UIScreen mainScreen].bounds toRect:self.originRect isDismiss:NO];
}

- (IBAction)pushNextController:(UIButton *)sender {
    ImageCheckController * imageVC = [[ImageCheckController alloc]initWithStyle:UITableViewStylePlain];
    [self.navigationController pushViewController:imageVC animated:YES];
}
@end
