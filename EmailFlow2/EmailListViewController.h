//
//  EmailListViewController.h
//  EmailFlow2
//
//  Created by Noel Proulx on 1/19/14.
//  Copyright (c) 2014 Noel Proulx. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EmailListViewController : UITableViewController

// define values for the email array object--------------------------------------------
#define EMAIL_VIEW_TITLE 0
#define EMAIL_VIEW_AVATAR 1
#define EMAIL_VIEW_PREVIEW 2
#define EMAIL_VIEW_READ 3
#define EMAIL_VIEW_TIME 4
#define EMAIL_VIEW_NAMES 5
#define EMAIL_VIEW_ACCOUNT_FLAG 6
#define EMAIL_VIEW_NEW_EMAIL 7
#define EMAIL_VIEW_TOTAL_EMAIL 8
//-------------------------------------------------------------------------------------

//define tags for List View Cells------------------------------------------------------
#define EMAIL_SUBJECT_TAG 1
#define EMAIL_AVATAR_TAG 2
#define EMAIL_TIME_TAG 3
#define EMAIL_NAMES_TAG 4
#define EMAIL_UNREAD_TAG 5
#define EMAIL_BLUE_DOT_TAG 6
#define EMAIL_PREVIEW_TAG 7
#define EMAIL_ACCOUNT_FLAG_TAG 8
#define EMAIL_LONGPRESS_VIEW_TAG 9

//-------------------------------------------------------------------------------------

//define special Properties
#define AVATAR_CORNER_RADIUS 6

//--
@property (nonatomic,strong) NSArray *emailContentList;

@property (nonatomic,strong) UIColor *blueAppColor, *lightGrayAppColor, *mediumGrayAppColor, *grayBackgroundAppColor;
@property (nonatomic,strong) NSIndexPath *currentlySelectedListCellPath;
@property (nonatomic, assign) int currentlySelectedListCell;
@end
