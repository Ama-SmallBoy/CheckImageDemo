//
//  SavePhotoInSystemAlum.m
//  UPOC
//
//  Created by Mac on 2017/11/13.
//  Copyright © 2017年 ミ﹏糖uF8FF寅╰☆. All rights reserved.
//

#import "SavePhotoInSystemAlum.h"
#import "AssistantActionSheet.h"

@interface SavePhotoInSystemAlum ()

@property(nonatomic,strong) AssistantActionSheet * actionSheet;

@end

@implementation SavePhotoInSystemAlum

+ (SavePhotoInSystemAlum *)sharedOtherFaceDeal
{
    static SavePhotoInSystemAlum * sharedManager = nil;
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        sharedManager = [[SavePhotoInSystemAlum alloc] init];
    });
    return sharedManager;
}
//保存到相册：
-(void)didSavePhotoAlumSheetWithImage:(UIImage *)imageCurrent{
    
#pragma mark -AssistantActionSheetClick
    dispatch_async(dispatch_get_main_queue(), ^{
        NSArray *otherTitles = @[@"保存图片"];
        self.actionSheet = [[AssistantActionSheet alloc] initWithTitle:nil cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:otherTitles handler:^(AssistantActionSheet *actionSheet, NSInteger index) {
            if (index == 1) {
                [self openAlbumWithImage:imageCurrent];
            }
        }];
        [self.actionSheet show];
    });
    
}
- (void)openAlbumWithImage:(UIImage *)imageLast{
    
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeSavedPhotosAlbum]) {
        
        UIImageWriteToSavedPhotosAlbum(imageLast, self, @selector(image:didFinishSavingWithError:contextInfo:), NULL);
        
    } else {
        NSLog(@"========请打开允许访问相册权限");
        //[[UTHudUtil shareInstance] toggleMessage:@"请打开允许访问相册权限"];
    }
}



// 指定回调方法
- (void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo
{
    if(!error){
        
        NSLog(@"========保存成功");
        //[[UTHudUtil shareInstance] toggleMessage:@"保存成功"];
    }else{
        NSLog(@"========保存失败，请打开 设置-隐私-照片 来进行设置");
        //[[UTHudUtil shareInstance] toggleMessage:@"保存失败，请打开 设置-隐私-照片 来进行设置"];
    }
}

@end
