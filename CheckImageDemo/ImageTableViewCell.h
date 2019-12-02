//
//  ImageTableViewCell.h
//  CheckImageDemo
//
//  Created by a on 2019/11/27.
//  Copyright © 2019 TeenageBeaconFireGroup. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
typedef void(^ShowImageBlock)(UIImageView * imgView);
@interface ImageTableViewCell : UITableViewCell
@property (nonatomic,copy) ShowImageBlock showImageBlock;
@end

NS_ASSUME_NONNULL_END
