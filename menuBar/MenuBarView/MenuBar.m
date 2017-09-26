//
//  menuBar.m
//  menuBar
//
//  Created by akshay bansal on 9/26/17.
//  Copyright © 2017 akshay bansal. All rights reserved.
//

#import "MenuBar.h"
#import "MenubarCell.h"
@interface MenuBar()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>
{
    UICollectionView *collectionView;
    NSString* cellId;
    const NSArray *imageNames;
    UIView *horizontalBarView;
    NSLayoutConstraint *horizontalBarLeftAnchor;

}
@end

@implementation MenuBar

-(void)awakeFromNib
{
    [super awakeFromNib];
    [self setupViews];
}

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupViews];
    }
    return self;
    
}



-(void)setupViews{
    
    cellId = @"cellId";
    imageNames = @[@"home",@"trending", @"subscriptions", @"account"];
    
    
    UICollectionViewLayout *layout= [[UICollectionViewFlowLayout alloc] init];
    collectionView=[[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
    collectionView.backgroundColor = [UIColor colorWithRed:230.0/255.0 green:32.0/255.0 blue:31.0/255.0 alpha:1];
    [collectionView registerClass:[MenubarCell class] forCellWithReuseIdentifier:cellId?cellId:@"cellId"];
    [self addSubview:collectionView];
    
    collectionView.translatesAutoresizingMaskIntoConstraints=false;
    [collectionView.topAnchor constraintEqualToAnchor:self.topAnchor constant:0].active=YES;
    [collectionView.bottomAnchor constraintEqualToAnchor:self.bottomAnchor constant:0].active=YES;
    [collectionView.leftAnchor constraintEqualToAnchor:self.leftAnchor constant:0].active=YES;
    [collectionView.rightAnchor constraintEqualToAnchor:self.rightAnchor constant:0].active=YES;
    
    NSIndexPath *selectedIndexPath = [NSIndexPath indexPathForItem:0 inSection:0];
    [collectionView selectItemAtIndexPath:selectedIndexPath animated:false scrollPosition:UICollectionViewScrollPositionNone];
    
    collectionView.dataSource = self;
    collectionView.delegate = self;
    
    [self setupHorizontalBar];
    
    
}


-(void)setupHorizontalBar{
    
    horizontalBarView=[[UIView alloc] init];
    horizontalBarView.backgroundColor=[UIColor colorWithWhite:0.9 alpha:1];
    [self addSubview:horizontalBarView];
    horizontalBarView.translatesAutoresizingMaskIntoConstraints=false;
    horizontalBarLeftAnchor = [horizontalBarView.leftAnchor constraintEqualToAnchor:self.leftAnchor constant:0];
    horizontalBarLeftAnchor.active=YES;
    [horizontalBarView.bottomAnchor constraintEqualToAnchor:self.bottomAnchor constant:0].active=YES;
    [horizontalBarView.heightAnchor constraintEqualToConstant:8].active=YES;
    [horizontalBarView.widthAnchor constraintEqualToAnchor:self.widthAnchor multiplier:1.0/4.0].active=YES;
    
   // [horizontalBarView.rightAnchor constraintEqualToAnchor:self.leftAnchor constant:0];
}


-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath

{
    
    float x = indexPath.item*(self.frame.size.width/4);
    horizontalBarLeftAnchor.constant=x;
    [UIView animateWithDuration:0.75 delay:0 usingSpringWithDamping:1 initialSpringVelocity:1 options:UIViewAnimationOptionCurveEaseOut animations:^{
        [self layoutIfNeeded];
        [self.delegate didSelectIndex:indexPath.item];
    } completion:^(BOOL finished) {
        
        
    }];
}



-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 0;
}

- (nonnull __kindof UICollectionViewCell *)collectionView:(nonnull UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
    
    MenubarCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellId forIndexPath:indexPath];
    cell.imageView.image =[[UIImage imageNamed:imageNames[indexPath.row]] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    cell.tintColor = [UIColor colorWithRed:91.0/255.0 green:14.0/255.0 blue:13.0/255.0 alpha:1];
    return cell;
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}
- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return 4;
}


-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(self.frame.size.width/4, self.frame.size.height);
    
}
@end
