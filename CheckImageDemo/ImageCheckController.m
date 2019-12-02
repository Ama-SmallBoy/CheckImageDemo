//
//  ImageCheckController.m
//  CheckImageDemo
//
//  Created by a on 2019/11/27.
//  Copyright © 2019 TeenageBeaconFireGroup. All rights reserved.
//

#import "ImageCheckController.h"
#import "ImageTableViewCell.h"
#import "ShowImageTool.h"
@interface ImageCheckController ()

@end

@implementation ImageCheckController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView registerNib:[UINib nibWithNibName:@"ImageTableViewCell" bundle:nil] forCellReuseIdentifier:@"ImageTableViewCell"];
    
    self.tableView.rowHeight = 86.0;
    self.tableView.sectionHeaderHeight = 20.0;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return 22;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    __weak ImageTableViewCell *imageTableViewCell = [tableView dequeueReusableCellWithIdentifier:@"ImageTableViewCell" forIndexPath:indexPath];
    imageTableViewCell.showImageBlock = ^(UIImageView * _Nonnull imgView) {
        CGRect originRect = [imageTableViewCell.contentView convertRect:imgView.frame toView:[UIApplication sharedApplication].windows.firstObject];
        [[ShowImageTool showImageTool] initDefaultImage:imgView.image originRect:originRect];
        [[ShowImageTool showImageTool] animationMoveFromRect:originRect toRect:[UIScreen mainScreen].bounds isDismiss:NO];
    };
    return imageTableViewCell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 20.0;
}
@end
