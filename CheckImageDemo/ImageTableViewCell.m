//
//  ImageTableViewCell.m
//  CheckImageDemo
//
//  Created by a on 2019/11/27.
//  Copyright © 2019 TeenageBeaconFireGroup. All rights reserved.
//

#import "ImageTableViewCell.h"
@interface ImageTableViewCell ()
@property (weak, nonatomic) IBOutlet UIImageView *image1;
@property (weak, nonatomic) IBOutlet UIImageView *image2;
@property (weak, nonatomic) IBOutlet UIImageView *image3;
@property (weak, nonatomic) IBOutlet UIImageView *image4;
@end
@implementation ImageTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    UITapGestureRecognizer * tapGestureRecognizer1 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(didTapImageViewAction:)];
     UITapGestureRecognizer * tapGestureRecognizer2 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(didTapImageViewAction:)];
     UITapGestureRecognizer * tapGestureRecognizer3 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(didTapImageViewAction:)];
     UITapGestureRecognizer * tapGestureRecognizer4 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(didTapImageViewAction:)];
    
    [self.image1 addGestureRecognizer:tapGestureRecognizer1];
    [self.image2 addGestureRecognizer:tapGestureRecognizer2];
    [self.image3 addGestureRecognizer:tapGestureRecognizer3];
    [self.image4 addGestureRecognizer:tapGestureRecognizer4];
}
-(void)didTapImageViewAction:(UITapGestureRecognizer *)tapGestureRecognizer{
    if ([tapGestureRecognizer.view isKindOfClass:[UIImageView class]]) {
        if (self.showImageBlock) {
            UIImageView * imgView = (UIImageView *)tapGestureRecognizer.view;
            self.showImageBlock(imgView);
        }
    }
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
