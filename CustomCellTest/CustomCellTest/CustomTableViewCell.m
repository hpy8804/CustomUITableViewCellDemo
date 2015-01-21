//
//  CustomTableViewCell.m
//  CustomCellTest
//
//  Created by sven on 1/20/15.
//  Copyright (c) 2015 sven@abovelink. All rights reserved.
//

#import "CustomTableViewCell.h"

#define kMostCountForShow  3  //show 3 when arrpics count not less than 3
                              //else show 1 when arrpics count not bigger than 2

@interface CustomTableViewCell ()
{
    UILabel *_labelTitle;
    UIImageView *_imageView01;
    UIImageView *_imageView02;
    UIImageView *_imageView03;
    UILabel *_labelResorce;
    UIImageView *_imageViewCommentsIcon;
    UILabel *_commentsCount;
    UILabel *_labelTime;
}
@end

@implementation CustomTableViewCell
@synthesize collection;

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self customSelfUI];
    }
    return self;
}

#pragma mark - methods

- (void)customSelfUI
{
    _labelTitle = [[UILabel alloc] initWithFrame:CGRectZero];
    [self.contentView addSubview:_labelTitle];
    _labelTitle.numberOfLines = 2;
    _labelTitle.font = [UIFont boldSystemFontOfSize:16.0f];
    
    _imageView01 = [[UIImageView alloc] initWithFrame:CGRectZero];
    [self.contentView addSubview:_imageView01];
    _imageView01.hidden = YES;
    
    _imageView02 = [[UIImageView alloc] initWithFrame:CGRectZero];
    [self.contentView addSubview:_imageView02];
    _imageView02.hidden = YES;
    
    _imageView03 = [[UIImageView alloc] initWithFrame:CGRectZero];
    [self.contentView addSubview:_imageView03];
    _imageView03.hidden = YES;
    
    _labelResorce = [[UILabel alloc] initWithFrame:CGRectZero];
    [self.contentView addSubview:_labelResorce];
    _labelResorce.font = [UIFont systemFontOfSize:12.0f];
    
    _imageViewCommentsIcon = [[UIImageView alloc] initWithFrame:CGRectZero];
    [self.contentView addSubview:_imageViewCommentsIcon];
    
    _commentsCount = [[UILabel alloc] initWithFrame:CGRectZero];
    [self.contentView addSubview:_commentsCount];
    _commentsCount.font = [UIFont systemFontOfSize:12.0f];
    
    _labelTime = [[UILabel alloc] initWithFrame:CGRectZero];
    [self.contentView addSubview:_labelTime];
    _labelTime.font = [UIFont systemFontOfSize:12.0f];
    _labelTime.textAlignment = NSTextAlignmentCenter;
}

#pragma mark - 

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    CGFloat selfWidth = self.frame.size.width;
    _imageView01.hidden = YES;
    _imageView02.hidden = YES;
    _imageView03.hidden = YES;
    
    if ([collection.arrPics count] >= kMostCountForShow) {
        _labelTitle.frame = CGRectMake(5, 0, selfWidth-5*2, 40);
        _labelTitle.text = collection.title;
        
        _imageView01.frame = CGRectMake(5, CGRectGetMaxY(_labelTitle.frame)+5, 80, 60);
        _imageView02.frame = CGRectMake(CGRectGetMaxX(_imageView01.frame)+20, CGRectGetMinY(_imageView01.frame), 80, 60);
        _imageView03.frame = CGRectMake(CGRectGetMaxX(_imageView02.frame)+20, CGRectGetMinY(_imageView01.frame), 80, 60);
        _imageView01.hidden = NO;
        _imageView02.hidden = NO;
        _imageView03.hidden = NO;
        _imageView01.image = [UIImage imageNamed:collection.arrPics[0]];
        _imageView02.image = [UIImage imageNamed:collection.arrPics[1]];
        _imageView03.image = [UIImage imageNamed:collection.arrPics[2]];
        
        _labelResorce.frame = CGRectMake(5, CGRectGetMaxY(_imageView01.frame)+5, 60, 30);
        _labelResorce.text = collection.resource;
        
        _imageViewCommentsIcon.frame = CGRectMake(CGRectGetMaxX(_labelResorce.frame)+5, CGRectGetMinY(_labelResorce.frame)+6, 20, 20);
        _imageViewCommentsIcon.image = [UIImage imageNamed:@"img_msg"];
        
        _commentsCount.frame = CGRectMake(CGRectGetMaxX(_imageViewCommentsIcon.frame)+2, CGRectGetMinY(_labelResorce.frame), 30, 30);
        _commentsCount.text = collection.commentsCount;
        
        _labelTime.frame = CGRectMake(selfWidth-110, CGRectGetMinY(_labelResorce.frame), 100, 30);
        _labelTime.text = collection.time;
        
    }else{
        _labelTitle.frame = CGRectMake(5, 0, selfWidth-5*2-100, 40);
        _labelTitle.text = collection.title;
        
        _imageView01.frame = CGRectMake(CGRectGetMaxX(_labelTitle.frame), 5, 80, 60);
        _imageView01.hidden = NO;
        _imageView01.image = [UIImage imageNamed:collection.arrPics[0]];
        
        _labelResorce.frame = CGRectMake(5, CGRectGetMaxY(_imageView01.frame)-25, 60, 30);
        _labelResorce.text = collection.resource;
        
        _imageViewCommentsIcon.frame = CGRectMake(CGRectGetMaxX(_labelResorce.frame)+5, CGRectGetMinY(_labelResorce.frame)+6, 20, 20);
        _imageViewCommentsIcon.image = [UIImage imageNamed:@"img_msg"];
        
        _commentsCount.frame = CGRectMake(CGRectGetMaxX(_imageViewCommentsIcon.frame)+2, CGRectGetMinY(_labelResorce.frame), 30, 30);
        _commentsCount.text = collection.commentsCount;
        
        _labelTime.frame = CGRectMake(selfWidth-10, CGRectGetMinY(_labelResorce.frame), 100, 30);
        _labelTime.text = collection.time;
    }
}

@end
