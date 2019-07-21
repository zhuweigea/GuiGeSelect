//
//  ViewController.m
//  电商规格选择
//
//  Created by 朱伟阁 on 2019/7/8.
//  Copyright © 2019 朱伟阁. All rights reserved.
//

#import "ViewController.h"
#import "GuiGeCell.h"
#import "FooterView.h"
#import "HeaderView.h"
#import "GuiGeModel.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic, strong) NSDictionary *dic;
@property(nonatomic, strong) UITableView *tv;
@property(nonatomic, strong) FooterView *fv;
@property(nonatomic, strong) HeaderView *hv;

@end

@implementation ViewController

-(UITableView *)tv{
    if(!_tv){
        _tv = [[UITableView alloc]initWithFrame:CGRectMake(0, self.view.bounds.size.height, self.view.bounds.size.width, 400) style:UITableViewStyleGrouped];
        _tv.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tv.delegate = self;
        _tv.dataSource = self;
        _tv.showsVerticalScrollIndicator = NO;
    }
    return _tv;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

//- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
//    return self.dic.allKeys[section];
//}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 40;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *v = [UIView new];
    v.backgroundColor = [UIColor whiteColor];
    v.frame = CGRectMake(0, 0, self.view.bounds.size.width, 40);
    UILabel *shouhuo = [UILabel new];
    shouhuo.text = self.dic.allKeys[section];
    shouhuo.textColor = [UIColor blackColor];
    shouhuo.font = [UIFont systemFontOfSize:15];
    shouhuo.frame = CGRectMake(10, 10, 100, 20);
    [v addSubview:shouhuo];
    return v;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.01;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    UIView *v = [UIView new];
    v.backgroundColor = [UIColor whiteColor];
    v.frame = CGRectMake(0, 0, self.view.bounds.size.width, 0.01);
    return v;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.dic.allKeys.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    GuiGeModel *model = [GuiGeModel new];
    model.select_index = -1;
    model.typeName = self.dic.allKeys[indexPath.section];
    model.valueArray = [self.dic objectForKey:model.typeName];
    GuiGeCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([GuiGeCell class])];
    if(!cell){
        cell = [[GuiGeCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:NSStringFromClass([GuiGeCell class])];
    }
    for (UIView *v in cell.contentView.subviews) {
        [v removeFromSuperview];
    }
    cell.hor_spacing = 10;
    cell.ver_spacing = 10;
    tableView.rowHeight = [cell UIANDDATA_initWith:model];
    return cell;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.dic = @{@"大小":@[@"大",@"中",@"小"],@"颜色":@[@"红色",@"绿色",@"蓝色",@"黄色",@"紫色",@"黑色",@"橘黄色",@"浅红色",@"橙色",@"白色",@"棕色",@"红色",@"绿色",@"蓝色"]};
    self.tv.tableHeaderView = [UIView new];
    self.hv = [[NSBundle mainBundle]loadNibNamed:@"HeaderView" owner:self options:nil].lastObject;
    self.tv.tableHeaderView = self.hv;
    self.fv = [[NSBundle mainBundle]loadNibNamed:@"FooterView" owner:self options:nil].lastObject;
    [self.fv.addBtn addTarget:self action:@selector(add) forControlEvents:UIControlEventTouchUpInside];
    [self.fv.reduceBtn addTarget:self action:@selector(reduce) forControlEvents:UIControlEventTouchUpInside];
    self.tv.tableFooterView = self.fv;
    UIButton *transform = [UIButton buttonWithType:UIButtonTypeCustom];
    [transform setTitle:@"规格选择" forState:UIControlStateNormal];
    [transform setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [transform setBackgroundColor:[UIColor blackColor]];
    transform.center = self.view.center;
    [transform setFrame:CGRectMake(0, 0, 100, 40)];
    transform.center = self.view.center;
    [transform addTarget:self action:@selector(transform) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:transform];
}

- (void)transform{
    [UIView animateWithDuration:0.25 animations:^{
        [self.tv setFrame:CGRectMake(0, self.view.bounds.size.height-400, self.view.bounds.size.width, 400)];
        [self.view addSubview:self.tv];
    } completion:^(BOOL finished) {
        
    }];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [UIView animateWithDuration:0.25 animations:^{
        [self.tv setFrame:CGRectMake(0, self.view.bounds.size.height, self.view.bounds.size.width, 400)];
    } completion:^(BOOL finished) {
        [self.tv removeFromSuperview];
    }];
}

- (void)add{
    
}

- (void)reduce{
    
}

@end
