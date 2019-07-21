//
//  FooterView.m
//  电商规格选择
//
//  Created by 朱伟阁 on 2019/7/8.
//  Copyright © 2019 朱伟阁. All rights reserved.
//

#import "FooterView.h"

@implementation FooterView

- (void)awakeFromNib{
    [super awakeFromNib];
    self.reduceBtn.layer.borderWidth = 0.5;
    self.reduceBtn.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.addBtn.layer.borderWidth = 0.5;
    self.addBtn.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.tf.layer.masksToBounds = YES;
    self.tf.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.tf.layer.borderWidth = 0.5;
}

@end
