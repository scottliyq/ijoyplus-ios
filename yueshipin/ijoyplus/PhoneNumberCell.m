//
//  PhoneNumberCell.m
//  ijoyplus
//
//  Created by joyplus1 on 12-10-12.
//  Copyright (c) 2012年 joyplus. All rights reserved.
//

#import "PhoneNumberCell.h"

@implementation PhoneNumberCell
@synthesize titleLabel;
@synthesize inputField;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
