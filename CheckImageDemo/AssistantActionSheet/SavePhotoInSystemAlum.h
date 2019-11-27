//
//  SavePhotoInSystemAlum.h
//  UPOC
//
//  Created by Mac on 2017/11/13.
//  Copyright © 2017年 ミ﹏糖uF8FF寅╰☆. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <UIKit/UIKit.h>

@interface SavePhotoInSystemAlum : NSObject

+ (SavePhotoInSystemAlum *)sharedOtherFaceDeal;

//保存到相册：

-(void)didSavePhotoAlumSheetWithImage:(UIImage *)imageCurrent;

@end
