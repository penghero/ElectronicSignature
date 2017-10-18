//
//  SignatureLayer.h
//  ElectronicSignature
//
//  Created by 陈鹏 on 2017/10/18.
//  Copyright © 2017年 penggege.CP. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import <UIKit/UIKit.h>
/**
 笔迹类
 */
@interface SignatureLayer : CALayer
{
    CAShapeLayer* signShapeLayer;
}

@property (nonatomic, strong) UIColor *drawingLineColor;
@property (nonatomic, assign) CGFloat drawingLineWidth;
@property (nonatomic, strong) UIView *belongView;

- (void)touchesBegan:(UITouch*)touche;
- (void)touchesMoved:(UITouch*)touche;
- (void)touchesEnded:(UITouch*)touche;
- (void)touchesCanceled:(UITouch*)touche;

@end
