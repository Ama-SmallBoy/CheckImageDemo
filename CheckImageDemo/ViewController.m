//
//  ViewController.m
//  CheckImageDemo
//
//  Created by a on 2019/11/27.
//  Copyright © 2019 TeenageBeaconFireGroup. All rights reserved.
//

#import "ViewController.h"
#import "ImageCheckController.h"
#import "ShowImageTool.h"
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imgView;
@property (weak, nonatomic) IBOutlet UIView *greenView;
@property (nonatomic,assign) CGRect originRect;

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
    self.originRect = imgVCRect2;

}
//图片展示
-(void)didShowImageAction:(UIGestureRecognizer*)gestureRecognizer{
   //初始化位置
   [[ShowImageTool showImageTool] initDefaultImage:self.imgView.image originRect:self.originRect];
   //展示
   [[ShowImageTool showImageTool] animationMoveFromRect:[ShowImageTool showImageTool].originRect toRect:[UIScreen mainScreen].bounds isDismiss:NO];
}

- (IBAction)pushNextController:(UIButton *)sender {
    ImageCheckController * imageVC = [[ImageCheckController alloc]initWithStyle:UITableViewStylePlain];
    [self.navigationController pushViewController:imageVC animated:YES];
}
@end
