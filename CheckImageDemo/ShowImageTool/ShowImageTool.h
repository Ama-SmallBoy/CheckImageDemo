//
//  ShowImageTool.h
//  CheckImageDemo
//
//  Created by a on 2019/12/2.
//  Copyright © 2019 TeenageBeaconFireGroup. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN

@interface ShowImageTool : NSObject
///创建单例模式：
+ (ShowImageTool *)showImageTool;

/// 初始化 原始位置 展示图片
/// @param showImage 展示图片
/// @param originRect 相对屏幕位置 原始位置
-(void)initDefaultImage:(UIImage *)showImage originRect:(CGRect)originRect;
/// 展示或隐藏 大图
/// @param startRect 开始的位置
/// @param endRect 结束的位置
/// @param isDismiss -->  YES 消失 NO 展示
-(void)animationMoveFromRect:(CGRect)startRect toRect:(CGRect)endRect isDismiss:(BOOL)isDismiss;
///存储 被展示 imageView 的  最初尺寸 imageView相对屏幕的相对frame
@property (nonatomic,assign) CGRect originRect;
@end

NS_ASSUME_NONNULL_END
