//
//  EmailListCell.m
//  EmailFlow2
//
//  Created by Noel Proulx on 1/19/14.
//  Copyright (c) 2014 Noel Proulx. All rights reserved.
//

#import "EmailListCell.h"

@implementation EmailListCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // email subject view
		[self.contentView addSubview:self.emailSubject];
    }
    return self;
}


- (UILabel *)emailSubject {
	if (!_emailSubject) {
		_emailSubject = [[UILabel alloc] initWithFrame:CGRectMake(49, 27, 243, 21)];
        //_emailSubject.font = [UIFont boldSystemFontOfSize:15.0f];
       // _emailSubject.textColor = [UIColor blackColor];
        [_emailSubject setFont:[UIFont systemFontOfSize:15.0]];
	}
	
	return _emailSubject;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
