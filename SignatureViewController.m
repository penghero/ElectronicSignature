//
//  SignatureViewController.m
//  ElectronicSignature
//
//  Created by 陈鹏 on 2017/10/18.
//  Copyright © 2017年 penggege.CP. All rights reserved.
//

#import "SignatureViewController.h"

@interface SignatureViewController ()
@property (strong, nonatomic) IBOutlet UIView *signView;

@end

@implementation SignatureViewController

- (instancetype)initWithImgView:(id)sender withCurrenBtn:(id)senderBtn{
    self = [super init];
    if (self) {
        _signImgView = (UIImageView*)sender;
        _signBtn = (UIButton*)senderBtn;
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.signLayer = [SignatureLayer new];
    self.signLayer.belongView = self.signView;
    [self.signView.layer addSublayer:self.signLayer];
}

- (IBAction)confirm:(id)sender {
    UIGraphicsBeginImageContext(self.signView.bounds.size);
    [self.signLayer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsBeginImageContext(CGSizeMake(343, 450));
    [image drawInRect:CGRectMake(0,0,343,450)];
    image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    UIImageView *imgv = [[UIImageView alloc] initWithImage:image];
    imgv.frame =CGRectMake(20, 20, 275, 180);
    self.signImgView.bounds = CGRectMake(0, 0, 275, 180);
    [self.view addSubview:imgv];
    NSFileManager *fileManager = [[NSFileManager alloc]init];
    NSString *pathDocuments = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)objectAtIndex:0];
    NSString *createPath = [NSString stringWithFormat:@"%@/Signa",pathDocuments];
    if (![[NSFileManager defaultManager]fileExistsAtPath:createPath]) {
        [fileManager createDirectoryAtPath:createPath withIntermediateDirectories:YES attributes:nil error:nil];
    }else{
        NSLog(@"有这个文件了");
    }
    NSString *str = [self.signBtn titleForState:UIControlStateDisabled];
    NSString *fileName = [NSString stringWithFormat:@"%@/%@.png",createPath,str];
        //把图片直接保存到指定的路径（同时应该把图片的路径imagePath存起来，下次就可以直接用来取）
    [UIImagePNGRepresentation(image) writeToFile:fileName atomically:YES];
    UIImage *imgTwo = [[UIImage alloc] initWithContentsOfFile:fileName];
    [self.signImgView setImage:imgTwo];
    [self dismissViewControllerAnimated:YES completion:nil];

}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    CGPoint p = [[touches anyObject] locationInView:self.view];
    if(CGRectContainsPoint(self.signView.frame, p)){
        [self.signLayer touchesBegan:[touches anyObject]];
    }
}
- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    CGPoint p = [[touches anyObject] locationInView:self.view];
    if(CGRectContainsPoint(self.signView.frame, p)){
        [self.signLayer touchesMoved:[touches anyObject]];
    }
}
- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    CGPoint p = [[touches anyObject] locationInView:self.view];
    if(CGRectContainsPoint(self.signView.frame, p)){
        [self.signLayer touchesEnded:[touches anyObject]];
    }
}


- (IBAction)cancel:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
//如需要横屏 打开下面注释
/*
-(BOOL)shouldAutorotate
{
    return YES;

}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {

    if ([[UIApplication sharedApplication] statusBarOrientation] == UIInterfaceOrientationPortrait || [[UIApplication sharedApplication] statusBarOrientation] == UIInterfaceOrientationPortraitUpsideDown) {
        return NO;
    }
    return YES;
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskLandscape;
}
*/
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
