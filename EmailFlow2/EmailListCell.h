//
//  EmailListCell.h
//  EmailFlow2
//
//  Created by Noel Proulx on 1/19/14.
//  Copyright (c) 2014 Noel Proulx. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EmailListCell : UITableViewCell

<<<<<<< HEAD
@property (strong,nonatomic) UILabel *emailSubject;
=======
@property (nonatomic, strong) UILabel *emailSubjectLine, *emailTimeLabel, *emailPreviewLabel, *emailReadUnreadNames;
@property (nonatomic, strong) UIImageView *emailBlueDot, *emailAvatar, *emailAccountFlag;

@property (nonatomic, strong) UIView *longpressView;

>>>>>>> develop
@end
