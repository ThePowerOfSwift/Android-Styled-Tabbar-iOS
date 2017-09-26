//
//  menubarCellCollectionViewCell.m
//  menuBar
//
//  Created by akshay bansal on 9/26/17.
//  Copyright © 2017 akshay bansal. All rights reserved.
//

#import "MenubarCell.h"

@implementation MenubarCell


-(instancetype)initWithFrame:(CGRect)frame
{
    self=[super initWithFrame:frame];
    if (self) {
        [self setupViews];
    }
    return self;
    
}


-(void)setupViews{
    
    self.imageView=[[UIImageView alloc] init];
    self.imageView.image=[[UIImage imageNamed:@"home"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    self.imageView.tintColor=[UIColor colorWithRed:91.0/255.0 green:14.0/255.0 blue:13.0/255.0 alpha:1];
    self.imageView.translatesAutoresizingMaskIntoConstraints=false;
    [self addSubview:self.imageView];
    
    [self.imageView.heightAnchor constraintEqualToConstant:28].active=YES;
    [self.imageView.widthAnchor constraintEqualToConstant:28].active=YES;
    [self.imageView.centerXAnchor constraintEqualToAnchor:self.centerXAnchor].active=YES;
    [self.imageView.centerYAnchor constraintEqualToAnchor:self.centerYAnchor].active=YES;
}

-(void)setSelected:(BOOL)selected
{
    self.imageView.tintColor = selected ?[UIColor whiteColor]: [UIColor colorWithRed:91.0/255.0 green:14.0/255.0 blue:13.0/255.0 alpha:1];
    
}

-(void)setHighlighted:(BOOL)highlighted
{
    self.imageView.tintColor = highlighted ?[UIColor whiteColor]: [UIColor colorWithRed:91.0/255.0 green:14.0/255.0 blue:13.0/255.0 alpha:1];
    
    
}

@end
