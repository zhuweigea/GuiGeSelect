//
//  GuiGeCell.m
//  电商规格选择
//
//  Created by 朱伟阁 on 2019/7/8.
//  Copyright © 2019 朱伟阁. All rights reserved.
//

#import "GuiGeCell.h"
#import "GuiGeModel.h"

@interface GuiGeCell (){
    NSArray *_contents;
    UIButton *_currentBtn;
    NSArray<UIButton *> *_btnarray;
}
@end

@implementation GuiGeCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self){
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return self;
}

- (CGFloat)UIANDDATA_initWith:(GuiGeModel *)model{
    _contents = model.valueArray;
    NSMutableArray *arr = [NSMutableArray arrayWithCapacity:0];
    CGFloat btnX = 0,btnY = 10,btnH = 30;
    CGFloat totalW = 0;
    for (int count = 0; count <_contents.count; count++) {
        UIButton *transform = [UIButton buttonWithType:UIButtonTypeCustom];
        [arr addObject:transform];
        transform.selected = NO;
        transform.layer.masksToBounds = YES;
        transform.layer.cornerRadius = 3;
        _currentBtn = transform;
        transform.tag = count + 100;
        transform.backgroundColor = [UIColor lightGrayColor];
        [transform.titleLabel setFont:[UIFont systemFontOfSize:15]];
        [transform setTitle:_contents[count] forState:UIControlStateNormal];
        [transform setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [transform setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
        [transform addTarget:self action:@selector(transform:) forControlEvents:UIControlEventTouchUpInside];
    CGFloat btnW = [_currentBtn.titleLabel.text boundingRectWithSize:CGSizeMake(MAXFLOAT, btnH) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15]} context:nil].size.width;
        btnW = btnW+10;
    int hang = 0;//标记是第几行
    if(_currentBtn.tag-100==0){
        btnX = self.hor_spacing;
    }else{
        btnX = totalW+self.hor_spacing;
    }
    totalW = btnX+btnW;
        if(totalW>WIDTH-self.hor_spacing*2){
            btnX = self.hor_spacing;
            totalW = btnX+btnW;
            hang+=1;
            btnY = btnH+self.ver_spacing*hang+btnY;
        }
    _currentBtn.frame = CGRectMake(btnX, btnY, btnW, btnH);
    [self.contentView addSubview:_currentBtn];
    }
    _btnarray = arr.copy;
    return CGRectGetMaxY(_currentBtn.frame)+self.ver_spacing;
}

- (void)transform:(UIButton *)sender{
    if(sender.selected==NO){
        sender.backgroundColor = [UIColor blackColor];
        sender.selected = YES;
    }else{
        sender.backgroundColor = [UIColor lightGrayColor];
        sender.selected = NO;
    }
    for (UIButton *btn in _btnarray) {
        if(btn.tag!=sender.tag){
            btn.selected = NO;
            btn.backgroundColor = [UIColor lightGrayColor];
        }
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
