//
//  EssenceTitleView.h
//  BaiSiBuDeJie
//
//  Created by YF on 16/10/21.
//  Copyright © 2016年 YF. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol EssenceTitleViewDelegate <NSObject>
/**
 *  选中了某个title
 */
- (void)seletcedTitle:(NSInteger)index;

@end

@interface EssenceTitleView : UIView

@property (nonatomic, assign) id <EssenceTitleViewDelegate> delegate;
/**
 *  移动当前的选中title
 *
 *  @param index 选中的index
 */
- (void)moveSeletcedButton:(NSInteger)index;

@end
