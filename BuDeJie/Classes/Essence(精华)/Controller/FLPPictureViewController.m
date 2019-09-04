//
//  FLPPictureViewController.m
//  BuDeJie
//
//  Created by lipeng feng on 2019/9/3.
//  Copyright © 2019 lipeng feng. All rights reserved.
//图片

#import "FLPPictureViewController.h"

@interface FLPPictureViewController ()

@end

@implementation FLPPictureViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //35就是标题的高度
    self.tableView.contentInset = UIEdgeInsetsMake(35, 0,0,0);
}

#pragma mark - Table view data source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 30;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CELLID"];
    if (nil == cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"CELLID"];
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"picture %ld --- %ld",indexPath.section,indexPath.row];
    
    return cell;
}

@end
