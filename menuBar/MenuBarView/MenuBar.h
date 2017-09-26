//
//  menuBar.h
//  menuBar
//
//  Created by akshay bansal on 9/26/17.
//  Copyright © 2017 akshay bansal. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol MenuBarDelegate

-(void)didSelectIndex:(NSInteger)index;

@end

@interface MenuBar : UIView
@property(nonatomic,weak)id<MenuBarDelegate> delegate;
@end
