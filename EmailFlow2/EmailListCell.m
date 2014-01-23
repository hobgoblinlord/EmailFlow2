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
        NSInteger boxes = screenWidth/4;
        NSInteger padding = (boxes-36)/2;
		_longpressView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, screenWidth, 98)];
        _longpressView.backgroundColor = [UIColor colorWithRed:122/255.0f green:122/255.0f blue:122/255.0f alpha:1.0f];
        _longpressView.hidden = YES;
        UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(padding, 20, 36, 36)];
        imgView.image = [UIImage imageNamed:@"Trash@2x.png"];
        [_longpressView addSubview: imgView];
        imgView = [[UIImageView alloc] initWithFrame:CGRectMake(padding+boxes, 20, 36, 36)];
        imgView.image = [UIImage imageNamed:@"Spam@2x.png"];
        [_longpressView addSubview: imgView];
        imgView = [[UIImageView alloc] initWithFrame:CGRectMake(padding+(boxes*2), 20, 36, 36)];
        imgView.image = [UIImage imageNamed:@"LabelHome@2x.png"];
        [_longpressView addSubview: imgView];
        imgView = [[UIImageView alloc] initWithFrame:CGRectMake(padding+(boxes*3), 20, 36, 36)];
        imgView.image = [UIImage imageNamed:@"LinkHome@2x.png"];
        [_longpressView addSubview: imgView];
        //draw the text labels for the icons
        UILabel  * label = [[UILabel alloc] initWithFrame:CGRectMake(0, 60, boxes, 16)];
        label.text = @"Delete";
        label.textAlignment = NSTextAlignmentCenter;
        label.textColor = [UIColor colorWithRed:255/255.0f green:255/255.0f blue:255/255.0f alpha:1.0f];
        [_longpressView addSubview: label];
        label = [[UILabel alloc] initWithFrame:CGRectMake(boxes, 60, boxes, 16)];
        label.text = @"Spam";
        label.textAlignment = NSTextAlignmentCenter;
        label.textColor = [UIColor colorWithRed:255/255.0f green:255/255.0f blue:255/255.0f alpha:1.0f];
        [_longpressView addSubview: label];
        label = [[UILabel alloc] initWithFrame:CGRectMake(boxes*2, 60, boxes, 16)];
        label.text = @"Label";
        label.textAlignment = NSTextAlignmentCenter;
        label.textColor = [UIColor colorWithRed:255/255.0f green:255/255.0f blue:255/255.0f alpha:1.0f];
        [_longpressView addSubview: label];
        label = [[UILabel alloc] initWithFrame:CGRectMake(boxes*3, 60, boxes, 16)];
        label.text = @"Link";
        label.textAlignment = NSTextAlignmentCenter;
        label.textColor = [UIColor colorWithRed:255/255.0f green:255/255.0f blue:255/255.0f alpha:1.0f];
        [_longpressView addSubview: label];
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
