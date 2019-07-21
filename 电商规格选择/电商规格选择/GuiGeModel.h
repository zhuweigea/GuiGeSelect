//
//  GuiGeModel.h
//  电商规格选择
//
//  Created by 朱伟阁 on 2019/7/8.
//  Copyright © 2019 朱伟阁. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface GuiGeModel : NSObject

@property(nonatomic, strong) NSString *typeName;
@property(nonatomic, strong) NSArray *valueArray;
@property(nonatomic, assign) NSInteger select_index;

@end

NS_ASSUME_NONNULL_END
