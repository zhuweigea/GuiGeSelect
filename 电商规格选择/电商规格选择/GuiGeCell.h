//
//  GuiGeCell.h
//  电商规格选择
//
//  Created by 朱伟阁 on 2019/7/8.
//  Copyright © 2019 朱伟阁. All rights reserved.
//

#define WIDTH [UIScreen mainScreen].bounds.size.width

#import <UIKit/UIKit.h>
@class GuiGeModel;
NS_ASSUME_NONNULL_BEGIN

@interface GuiGeCell : UITableViewCell

- (CGFloat)UIANDDATA_initWith:(GuiGeModel *)model;

@property(nonatomic, assign) CGFloat hor_spacing;//按钮水平间隔
@property(nonatomic, assign) CGFloat ver_spacing;//按钮垂直间隔

@end

NS_ASSUME_NONNULL_END
