//
//  ViewController.m
//  menuBar
//
//  Created by akshay bansal on 9/26/17.
//  Copyright © 2017 akshay bansal. All rights reserved.
//

#import "ViewController.h"
#import "MenuBar.h"

@interface ViewController ()<MenuBarDelegate>

@property (strong, nonatomic) IBOutlet MenuBar *menuBar;
@property (strong, nonatomic) IBOutlet UILabel *selectedIndex;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
  /*
    menubar=[[menuBar alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 50)];
    [self.view addSubview:menubar];
    menubar.translatesAutoresizingMaskIntoConstraints=false;
    [menubar.topAnchor constraintEqualToAnchor:self.view.topAnchor constant:40].active=YES;
    [menubar.leftAnchor constraintEqualToAnchor:self.view.leftAnchor constant:0].active=YES;
    [menubar.rightAnchor constraintEqualToAnchor:self.view.rightAnchor constant:0].active=YES;
    [menubar.heightAnchor constraintEqualToConstant:50].active=YES;
 
   */
    
    
    self.menuBar.delegate=self;
    self.selectedIndex.text=@"selceted index = 0";
}

-(void)didSelectIndex:(NSInteger)index{
    
    
    self.selectedIndex.text=[NSString stringWithFormat:@"Selected Index = %ld",(long)index];
    
    
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
