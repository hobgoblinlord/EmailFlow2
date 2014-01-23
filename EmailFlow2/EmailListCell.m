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
        // Initialization code
        self.contentView.backgroundColor = [UIColor whiteColor];
        [self.contentView addSubview:self.emailSubjectLine];
        [self.contentView addSubview:self.emailTimeLabel];
        [self.contentView addSubview:self.emailBlueDot];
        [self.contentView addSubview:self.emailPreviewLabel];
        [self.contentView addSubview:self.emailReadUnreadNames];
        [self.contentView addSubview:self.emailAvatar];
        [self.contentView addSubview:self.emailAccountFlag];
        [self.contentView addSubview:self.longpressView];
    }
    return self;
}

#pragma mark - Long Press Overlay

- (UIView *)longpressView {
	if (!_longpressView) {
        NSInteger screenWidth = [UIScreen mainScreen].bounds.size.width;
		_longpressView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, screenWidth, 98)];
        _longpressView.hidden = YES;
	}
	
	return _longpressView;
}

#pragma mark - Email Subject View

- (UILabel *)emailSubjectLine {
	if (!_emailSubjectLine) {
		_emailSubjectLine = [[UILabel alloc] initWithFrame:CGRectMake(49, 27, 243, 21)];
		[_emailSubjectLine setFont:[UIFont boldSystemFontOfSize:15.0f]];
		[_emailSubjectLine setTextAlignment:NSTextAlignmentLeft];
	}
	
	return _emailSubjectLine;
}

#pragma mark - Email Time View

- (UILabel *)emailTimeLabel {
	if (!_emailTimeLabel) {
		_emailTimeLabel = [[UILabel alloc] initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width-66, 12, 60, 21)];
		[_emailTimeLabel setFont:[UIFont systemFontOfSize:14.0f]];
		[_emailTimeLabel setTextAlignment:NSTextAlignmentRight];
	}
	
	return _emailTimeLabel;
}

#pragma mark - Email Preview Label

- (UILabel *)emailPreviewLabel {
	if (!_emailPreviewLabel) {
		_emailPreviewLabel = [[UILabel alloc] initWithFrame:CGRectMake(9, 49, [UIScreen mainScreen].bounds.size.width-15, 35)];
		[_emailPreviewLabel setFont:[UIFont systemFontOfSize:14.0f]];
		[_emailPreviewLabel setTextAlignment:NSTextAlignmentLeft];
        [_emailPreviewLabel setNumberOfLines:2];
        
	}
	
	return _emailPreviewLabel;
}

#pragma mark - Email Read Unread and Names

- (UILabel *)emailReadUnreadNames {
	if (!_emailReadUnreadNames) {
		_emailReadUnreadNames = [[UILabel alloc] initWithFrame:CGRectMake(9, 12, 164, 21)];
		[_emailReadUnreadNames setFont:[UIFont systemFontOfSize:14.0f]];
		[_emailReadUnreadNames setTextAlignment:NSTextAlignmentLeft];
	}
	
	return _emailReadUnreadNames;
}

#pragma mark - Email Blue Dot

- (UIImageView *)emailBlueDot {
	if (!_emailBlueDot) {
		_emailBlueDot = [[UIImageView alloc] initWithFrame:CGRectMake(49, 18, 10, 10)];
	}
	
	return _emailBlueDot;
}

#pragma mark - Email Avatar

- (UIImageView *)emailAvatar {
	if (!_emailAvatar) {
		_emailAvatar = [[UIImageView alloc] initWithFrame:CGRectMake(9, 9, 36, 36)];
	}
	
	return _emailAvatar;
}

#pragma mark - Email Account Flag

- (UIImageView *)emailAccountFlag {
	if (!_emailAccountFlag) {
		_emailAccountFlag = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 8, 20)];
	}
	
	return _emailAccountFlag;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
