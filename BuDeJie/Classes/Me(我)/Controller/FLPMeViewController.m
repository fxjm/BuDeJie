//
//  FLPMeViewController.m
//  BuDeJie
//
//  Created by lipeng feng on 2019/8/22.
//  Copyright © 2019 lipeng feng. All rights reserved.
//

#import "FLPMeViewController.h"
#import "FLPSettingViewController.h"
#import "FLPSquareCell.h"
#import <AFNetworking/AFNetworking.h>
#import <MJExtension/MJExtension.h>
#import "FLPSquareItem.h"
#import "FLPWebViewController.h"
static NSString * const meId = @"meId";
static NSInteger const col = 4;
static CGFloat const margin = 1;
#define itemWH (FLPScreenW - (col - 1) * margin) / col
@interface FLPMeViewController ()<UICollectionViewDataSource,UICollectionViewDelegate>
/** 数据 */
@property (nonatomic, strong) NSMutableArray *items;

/** footerView */
@property (nonatomic, strong) UICollectionView *collectionView;
@end

@implementation FLPMeViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    
    //设置tableveiw
    [self setUpTable];
    
    //设置tableView的footView
    [self setUpFooterView];
    
    //加载数据
    [self loadData];
    
    [self setNavTitle];
}


#pragma mark - TableView
- (void)setUpTable {
    self.tableView.sectionFooterHeight = 10;
    self.tableView.sectionHeaderHeight = 0;
    self.tableView.contentInset = UIEdgeInsetsMake(-25, 0, 0, 0);
}

- (void)setUpFooterView {
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.minimumLineSpacing = margin;
    layout.minimumInteritemSpacing = margin;
//    CGFloat itemWH = (FLPScreenW - (col - 1) * margin) / col;
    layout.itemSize = CGSizeMake(itemWH, itemWH);
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, 0, 4000) collectionViewLayout:layout];
    [collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:meId];
    
    [collectionView registerNib:[UINib nibWithNibName: NSStringFromClass([FLPSquareCell class]) bundle:nil] forCellWithReuseIdentifier:meId];
    collectionView.backgroundColor = self.tableView.backgroundColor;
    collectionView.scrollEnabled = NO;
    collectionView.dataSource = self;
    collectionView.delegate = self;
    _collectionView = collectionView;
    self.tableView.tableFooterView = collectionView;
}

-(void)loadData{
    AFHTTPSessionManager *mgr = [AFHTTPSessionManager manager];
    __weak typeof(self) weakSelf = self;
    NSMutableDictionary *para = [NSMutableDictionary dictionary];
    para[@"a"] = @"square";
    para[@"c"] = @"topic";
    [mgr GET:@"http://api.budejie.com/api/api_open.php" parameters:para progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSArray *squareList = responseObject[@"square_list"];
        weakSelf.items = [NSMutableArray array];
        for (int i = 0; i < squareList.count; ++i) {
            if ([squareList[i] isKindOfClass:[NSDictionary class]]) {
                FLPSquareItem *item = [FLPSquareItem mj_objectWithKeyValues:squareList[i]];
                [weakSelf.items addObject:item];
            }
        }
        
        //填充空白
        [weakSelf resevItem];
        
        //计算高度
        NSInteger row = (weakSelf.items.count - 1) / col + 1;
        CGFloat collectionViewH = row * itemWH;
        weakSelf.collectionView.flp_height = collectionViewH;
        weakSelf.tableView.tableFooterView = weakSelf.collectionView;
        [self.collectionView reloadData];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
}

#pragma mark - 填充空白
-(void)resevItem{
    NSInteger count = self.items.count;
    NSInteger remainder = count % col;
    if (remainder) {
        remainder = col - remainder;
    }
    for (int i = 0; i < remainder; ++i) {
        FLPSquareItem * item = [[FLPSquareItem alloc] init];
        [self.items addObject:item];
    }
}

#pragma mark - 设置title
-(void)setNavTitle{
    //设置标题
    self.navigationItem.title = @"我";
    //设置右边的items
    UIBarButtonItem *nightItem = [UIBarButtonItem itemWithImage:[UIImage imageNamed:@"mine-moon-icon"] selectedImage:[UIImage imageNamed:@"mine-moon-icon-click"] target:self action:@selector(night:)];
    
    UIBarButtonItem *settingItem = [UIBarButtonItem itemWithImage:[UIImage imageNamed:@"mine-setting-icon"] hightImage:[UIImage imageNamed:@"mine-setting-icon-click"] target:self action:@selector(setting)];
    
    self.navigationItem.rightBarButtonItems = @[settingItem,nightItem];
    

    
}

#pragma mark - titleAction

-(void)night:(UIButton *)btn{
    btn.selected = !btn.selected;
}
-(void)setting{
    FLPSettingViewController *settingVc = [[FLPSettingViewController alloc] init];
    settingVc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:settingVc animated:YES];
}


#pragma mark - UICollectionViewDataSource
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.items.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    FLPSquareCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:meId forIndexPath:indexPath];
    cell.squareItem = self.items[indexPath.item];
    return  cell;
}

#pragma mark - UICollectionViewDelegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    FLPSquareItem * item = self.items[indexPath.item];
    if ([item.url hasPrefix:@"http"]) {
        FLPWebViewController *webView = [[FLPWebViewController alloc] init];
        webView.url = item.url;
        [self.navigationController pushViewController:webView animated:YES];
    }
}


@end
