//
//  ButtonView.h
//  TableNested
//
//  Created by 纵昂 on 2019/5/5.
//  Copyright © 2019 纵昂. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol ButtonViewDelegate<NSObject>

-(void)selectBtnWithTag:(UIButton *)sender;
@end
NS_ASSUME_NONNULL_BEGIN

@interface ButtonView : UIView
{
    UIView    * _lineView;
    UIButton        *_lastBtn;
    
}
@property (nonatomic ,assign) NSInteger  selected;
@property(nonatomic,strong)UIScrollView*  scroview;
@property(nonatomic,strong)NSArray * titleArr;
@property(nonatomic,weak)id<ButtonViewDelegate>delegate;
-(instancetype)initWithFrame:(CGRect)frame titleArr:(NSArray *)titleArr;

@end

NS_ASSUME_NONNULL_END
