//
//  EmailListCell.h
//  EmailFlow2
//
//  Created by Noel Proulx on 1/19/14.
//  Copyright (c) 2014 Noel Proulx. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EmailListCell : UITableViewCell

@property (nonatomic, strong) UILabel *emailSubjectLine, *emailTimeLabel, *emailPreviewLabel, *emailReadUnreadNames;
@property (nonatomic, strong) UIImageView *emailBlueDot, *emailAvatar, *emailAccountFlag;

@end
