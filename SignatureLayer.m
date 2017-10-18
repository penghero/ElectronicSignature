//
//  SignatureLayer.m
//  ElectronicSignature
//
//  Created by 陈鹏 on 2017/10/18.
//  Copyright © 2017年 penggege.CP. All rights reserved.
//

#import "SignatureLayer.h"
@interface SignatureLayer ()
@property (nonatomic, strong) UIToolbar* myToolbar;
@property (nonatomic, strong) NSMutableArray* drawingAllPoints;
@property (nonatomic, strong) NSMutableArray* drawingOppPoints;
@end

@implementation SignatureLayer
@synthesize drawingAllPoints;
@synthesize drawingOppPoints;
@synthesize belongView;

- (id)init{
    self = [super init];
    if (self) {
        self.drawingLineColor = [UIColor blackColor];
        drawingOppPoints = [NSMutableArray new];
        drawingAllPoints = [NSMutableArray new];
        signShapeLayer = nil;
    }
    return self;
}
- (void)display {
    UIBezierPath* pPath = [UIBezierPath bezierPath];
    for (int i = 0; i < drawingAllPoints.count; i++) {
        CGPoint pt = [[drawingAllPoints objectAtIndex:i] CGPointValue];
        if (i == 0) {
            [pPath moveToPoint:pt];
        }
        else {
            [pPath addLineToPoint:pt];
        }
    }
    signShapeLayer.path = [pPath CGPath];
    signShapeLayer.fillColor = [[UIColor clearColor] CGColor];
    signShapeLayer.lineWidth = 8.0f;
    signShapeLayer.strokeColor = [[UIColor blackColor] CGColor];
}
- (void)touchesBegan:(UITouch*)touch {
    CGPoint pt = [touch locationInView:self.belongView];
    [drawingAllPoints addObject:[NSValue valueWithCGPoint:pt]];
    signShapeLayer = [CAShapeLayer new];
    [self addSublayer:signShapeLayer];
}
- (void)touchesMoved:(UITouch*)touch {
    CGPoint pt = [touch locationInView:self.belongView];
    [drawingAllPoints addObject:[NSValue valueWithCGPoint:pt]];
    [self setNeedsDisplay];
}
- (void)touchesEnded:(UITouch*)touch {
    signShapeLayer = nil;
    [drawingAllPoints removeAllObjects];
}
- (void)touchesCanceled:(UITouch *)touche {
    signShapeLayer = nil;
    [drawingAllPoints removeAllObjects];
}

@end
