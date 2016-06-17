//
//  HomeViewController.m
//  WarikanApp
//
//  Created by 宮崎数磨 on 2016/06/17.
//  Copyright © 2016年 Miyazaki Kazuma. All rights reserved.
//

#import "HomeViewController.h"

@interface HomeViewController ()
@property (weak, nonatomic) IBOutlet UITextField *moneyTextField;
@property (weak, nonatomic) IBOutlet UITextField *peopleNumberTextFiled;
@property (weak, nonatomic) IBOutlet UILabel *sentenceTextField;

- (IBAction)tappedWarikanButton:(id)sender;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 背景をクリックしたら、キーボードを隠す
    UITapGestureRecognizer *gestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(closeSoftKeyboard)];
    [self.view addGestureRecognizer:gestureRecognizer];
    
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)closeSoftKeyboard{
    
    [self.view endEditing: YES];
}

-(void)calculation{
    
    int money = _moneyTextField.text.intValue;
    int peopleNumber = _peopleNumberTextFiled.text.intValue;
    
    
    if (money > 0 && peopleNumber > 0) {
        
        if (peopleNumber == 1) {
            
            _sentenceTextField.text = @"人数は2人以上入力してください。";
            
            return;
        }
        int quotient = money / peopleNumber;
        int amari = money % peopleNumber;
        
        NSString *oneString = @"1人あたりの支払い金額は、";
        NSString *twoString = @"円です。";
        
        if (amari == 0) {
            
            NSString *moneyString = [NSString stringWithFormat:@"%d",quotient];
            
            _sentenceTextField.text = [NSString stringWithFormat:@"%@%@%@",oneString,moneyString,twoString];
            
            return;
            
        }
        
        int smallQuotient = quotient / 100;
        int newSmallQuotient = smallQuotient + 1;
        int newQuotient = newSmallQuotient * 100;
            
        NSString *newQuotientString = [NSString stringWithFormat:@"%d",newQuotient];
        
        _sentenceTextField.text = [NSString stringWithFormat:@"%@%@%@",oneString,newQuotientString,twoString];
        
        return;
    }
    _sentenceTextField.text = @"合計、又は、人数が未入力です。";
}


- (IBAction)tappedWarikanButton:(id)sender {
    
    [self calculation];
    
    [self.view endEditing: YES];
}
@end
