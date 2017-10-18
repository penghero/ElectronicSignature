//
//  NeedSignViewController.m
//  ElectronicSignature
//
//  Created by 陈鹏 on 2017/10/18.
//  Copyright © 2017年 penggege.CP. All rights reserved.
//

#import "NeedSignViewController.h"
#import "SignatureViewController.h"

@interface NeedSignViewController ()

@property (strong, nonatomic) IBOutlet UIImageView *signView;

@end

@implementation NeedSignViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (IBAction)helpSign:(id)sender {
    
}

- (IBAction)jump:(id)sender {
    SignatureViewController *sign = [[SignatureViewController alloc] initWithImgView:self.signView withCurrenBtn:sender];
    [self presentViewController:sign animated:YES completion:nil];
}

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
