//
//  FLPTagSubTableViewController.m
//  BuDeJie
//
//  Created by lipeng feng on 2019/8/27.
//  Copyright © 2019 lipeng feng. All rights reserved.
//

#import "FLPTagSubTableViewController.h"
#import "FLPSubTag.h"
#import "FLPSubTagCell.h"
#import <SVProgressHUD/SVProgressHUD.h>
#import <AFNetworking/AFNetworking.h>
#import <MJExtension/MJExtension.h>

static NSString * const ID = @"tagSubCell";
@interface FLPTagSubTableViewController ()
/** 数据 */
@property (nonatomic, strong) NSArray *subTags;

@property (nonatomic, strong) AFHTTPSessionManager *mgr;
@end

@implementation FLPTagSubTableViewController
#pragma mark - 生命周期方法

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [SVProgressHUD dismiss];
    //取消网络任务
   [_mgr.tasks makeObjectsPerformSelector:@selector(cancel)];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"推荐标签";
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([FLPSubTagCell class]) bundle:nil] forCellReuseIdentifier:ID];
    self.tableView.rowHeight = 81;
    self.tableView.backgroundColor = FLPColor(220, 220, 221);
    //第一种设置全屏分割线的方式:设置不显示线，然后重写cell的setFrame方法
//    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    //第二种设置全屏分割线的方式: cell中也需要设置
//    self.tableView.layoutMargins = UIEdgeInsetsMake(0, 0, 0, 0 );
    self.tableView.separatorInset = UIEdgeInsetsMake(0, 0, 0, 0);
    [self loadData];
}

#pragma mark - loadData
-(void)loadData{
     [SVProgressHUD showInfoWithStatus:@"加载中..."];
    AFHTTPSessionManager *mgr = [AFHTTPSessionManager manager];
    _mgr = mgr;
    // 2.拼接参数
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    parameters[@"a"] = @"tag_recommend";
    parameters[@"action"] = @"sub";
    parameters[@"c"] = @"topic";
    
    __weak typeof(self) weakSelf = self;
    // 3.发送请求
    [mgr GET:@"http://api.budejie.com/api/api_open.php" parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, NSArray *  _Nullable responseObject) {
        
        [SVProgressHUD dismiss];
        // 字典数组转换模型数组
        weakSelf.subTags = [FLPSubTag mj_objectArrayWithKeyValuesArray:responseObject];
        
        // 刷新表格
        [self.tableView reloadData];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [SVProgressHUD dismiss];
    }];

}

#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.subTags.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    FLPSubTagCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    cell.subTag = self.subTags[indexPath.row];
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
