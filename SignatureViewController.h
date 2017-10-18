//
//  SignatureViewController.h
//  ElectronicSignature
//
//  Created by 陈鹏 on 2017/10/18.
//  Copyright © 2017年 penggege.CP. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SignatureLayer.h"

/**
 签名控制器
 */
@interface SignatureViewController : UIViewController

@property (nonatomic, strong) CAShapeLayer *drawingLayer;
@property (nonatomic, strong) SignatureLayer *signLayer;
@property (nonatomic, strong)UIImageView *signImgView;
@property (nonatomic, strong) UIButton *signBtn;

- (instancetype)initWithImgView:(id)sender withCurrenBtn:(id)senderBtn;

@end
