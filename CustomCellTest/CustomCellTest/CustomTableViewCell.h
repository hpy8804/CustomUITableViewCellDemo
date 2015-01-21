//
//  CustomTableViewCell.h
//  CustomCellTest
//
//  Created by sven on 1/20/15.
//  Copyright (c) 2015 sven@abovelink. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Collection.h"

@interface CustomTableViewCell : UITableViewCell
@property (nonatomic, strong) Collection *collection;
@end
