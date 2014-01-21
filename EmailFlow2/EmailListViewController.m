//
//  EmailListViewController.m
//  EmailFlow2
//
//  Created by Noel Proulx on 1/19/14.
//  Copyright (c) 2014 Noel Proulx. All rights reserved.
//

#import "EmailListViewController.h"
#import "EmailListCell.h"
#import "GravatarHelper.h"

// gravatar
//#import "GravatarServiceFactory.h"

// email list cell
#define EmailListCellIdentifier @"EmailListCellIdentifier"

@interface EmailListViewController ()

@end

@implementation EmailListViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	
	[self setUpTable];

    _blueAppColor = [UIColor colorWithRed:0/255.0f green:122/255.0f blue:255/255.0f alpha:1.0f];
    _lightGrayAppColor = [UIColor colorWithRed:204/255.0f green:204/255.0f blue:204/255.0f alpha:1.0f];
    _mediumGrayAppColor = [UIColor colorWithRed:122/255.0f green:122/255.0f blue:122/255.0f alpha:1.0f];
    _grayBackgroundAppColor = [UIColor colorWithRed:247/255.0f green:247/255.0f blue:247/255.0f alpha:1.0f];

    _currentlySelectedListCell = -1;

    // _email Content list key TITLE:String, AVATAR:String, DESCRIPTION:String, READ:Boolean, TIME:String, ACCOUNT FLAG:String, New Email:int, Total Email:int
    
    _emailContentList =@[@[@"How's it going",@"bgoss@incubate.co",@"Just wanted to see what you are up to and how things have been. is everything ok in your corner of the world. hit me up with what's going on this weekend",@false,@"8:10p",@"Brian Goss",@"redTri.png",@"4",@"7",],
                         @[@"Who went to the party last night",@"jgoss@incubate.co",@"If you went to the party did you see my keys?",@true,@"7:12p",@"Jeff Goss",@"redTri.png",@"0",@"4",],
                         @[@"Are you going to the meeting?",@"nfennel@incubate.co",@"Are you going to be here in time for the meeting? what time do you think you will get here if you are?",@false,@"5:14a",@"Nathan",@"blueTri.png",@"3",@"20"],
                         @[@"What Time is the Party?",@"nproulx@incubate.co",@"What time should I arrive?",@false,@"3:14a",@"Noel Proulx",@"blueTri.png",@"1",@"5"],
                         @[@"Hey Check this out",@"tchmieleski@incubate.co",@"I thought that this article was really useful. take a look and let me know what you think and if we should use this method",@true,@"Tue",@"Troy Chmieleski",@"blueTri.png",@"0",@"1"]];
	
	NSMutableArray *performanceTest = [NSMutableArray arrayWithArray:_emailContentList];
	
	NSUInteger numberOfAdditionalCells = 100;
	
	for (NSUInteger i = 0; i < numberOfAdditionalCells; i++) {
		[performanceTest addObject:@[@"How's it going",@"bgoss@incubate.co",@"Just wanted to see what you are up to and how things have been. is everything ok in your corner of the world. hit me up with what's going on this weekend",@false,@"8:10p",@"Brian Goss",@"redTri.png",@"4",@"7",]];
	}
	
	_emailContentList = performanceTest;
}

#pragma mark - Set up table

- (void)setUpTable {
	[self.tableView registerClass:[EmailListCell class] forCellReuseIdentifier:EmailListCellIdentifier];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{

    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    // Return the number of rows in the section.
    return _emailContentList.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath;
{
    return 98;
}

-(void) handleLongPress: (UIGestureRecognizer *)longPress
{
    if (longPress.state==UIGestureRecognizerStateBegan)
    {
        CGPoint p = [longPress locationInView:self.tableView];
        
        NSIndexPath *indexPath = [self.tableView indexPathForRowAtPoint:p];
        // if another cell is currently being longpressed clear it
        int theCurrentCell = [self getCurrentlySelectedListCell];
        if(theCurrentCell >-1)
        {
            NSIndexPath *indexPath2 = [self getCurrentlySelectedListCellPath];
            [self updateLongpressView:indexPath2];
        }
        [self setCurrentlySelectedListCellPath:indexPath];
        [self setCurrentlySelectedListCell:indexPath.row];
        if (indexPath == nil)
        {
            NSLog(@"No Cell");
        }
        else
        {
            static NSString *CellIdentifier = @"EmailListCell";
            EmailListCell *cell = [self.tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
            UIView *longPressView = (UIView*)[self.view viewWithTag:(indexPath.row*100)+EMAIL_LONGPRESS_VIEW_TAG];
            [longPressView setAlpha:1.0];
            
            

        }
    }
}

- (void)updateLongpressView:(NSIndexPath *)tagField {
    UIView *longPressView = (UIView*)[self.view viewWithTag:(tagField.row*100)+EMAIL_LONGPRESS_VIEW_TAG];
        [longPressView setAlpha:0.0];
    [self setCurrentlySelectedListCell:-1];
}

- (NSIndexPath*) getCurrentlySelectedListCellPath
{
    return _currentlySelectedListCellPath;
}

- (void) setCurrentlySelectedListCellPath:(NSIndexPath *)cellValue
{
    _currentlySelectedListCellPath = cellValue;
}

- (NSInteger) getCurrentlySelectedListCell
{
    
    // Return the number of rows in the section.
    return _currentlySelectedListCell;
}

- (void) setCurrentlySelectedListCell:(int)cellValue
{
    _currentlySelectedListCell = cellValue;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    EmailListCell *cell = [tableView dequeueReusableCellWithIdentifier:EmailListCellIdentifier forIndexPath:indexPath];
    int row = [indexPath row];
    UILabel *emailSubjectLine, *emailTimeLine, *emailPreview, *emailReadUnread;
    UIImageView  *emailAccountFlag, *dotImgView;
    
    // Configure the cell...
    
    int xpos = 49; //default x for title and names
    int xpos2 = 0; // for the blue dot
    int screenWidth = [UIScreen mainScreen].bounds.size.width; // screen width
    
    NSString *defaultURL = @"default";
    NSURL *gravatarDefaultURL = [GravatarHelper getGravatarURL:defaultURL];
    
    NSData *imageDefaultData = [NSData dataWithContentsOfURL:gravatarDefaultURL];
    
    //compile the unread/total emails and names
    NSString *readUnreadPlaceholder =[NSString stringWithFormat:@"%@/%@ %@", _emailContentList[row][EMAIL_VIEW_NEW_EMAIL],_emailContentList[row][EMAIL_VIEW_TOTAL_EMAIL], _emailContentList[row][EMAIL_VIEW_NAMES]];
    NSMutableAttributedString *emailReadString = [[NSMutableAttributedString alloc]initWithString:readUnreadPlaceholder];
    
    if([_emailContentList[row][EMAIL_VIEW_AVATAR] isEqual: @""])
    {
        xpos = 9;// if there is no avatar image drop the title and names to the left
    }
    
    //check if any emails are unread - if so add dot and change unread number to blue
    if([_emailContentList[row][EMAIL_VIEW_NEW_EMAIL] isEqual: @"0"])
    {
        //no unread emails default to grey for the entire string
        [emailReadString addAttribute:NSForegroundColorAttributeName value:_mediumGrayAppColor range:NSMakeRange(0, readUnreadPlaceholder.length)];
    }
    else{
        //add the dot
        dotImgView = [[UIImageView alloc] initWithFrame:CGRectMake(xpos, 18, 10, 10)];
        dotImgView.image = [UIImage imageNamed:@"NewMail@2x.png"];
        [cell.contentView addSubview: dotImgView];
        xpos2 = 12;
        // to change the color of unread emails to blue
        NSString *getLength = _emailContentList[row][EMAIL_VIEW_NEW_EMAIL];
        NSRange range = NSMakeRange (0, getLength.length);
        [emailReadString addAttribute:NSForegroundColorAttributeName value:_mediumGrayAppColor range:NSMakeRange(0, readUnreadPlaceholder.length)];
        [emailReadString addAttribute:NSForegroundColorAttributeName value:_blueAppColor range:range];
    }
    
    // email subject ----------------------------------------------------------------------
    emailSubjectLine = [[UILabel alloc] initWithFrame:CGRectMake(xpos, 27, 243, 21)];
    emailSubjectLine.tag = EMAIL_SUBJECT_TAG;
    emailSubjectLine.font = [UIFont boldSystemFontOfSize:15.0f];
    emailSubjectLine.textColor = [UIColor blackColor];
    emailSubjectLine.numberOfLines = 1;
    emailSubjectLine.text = _emailContentList[row][EMAIL_VIEW_TITLE];
    [cell.contentView addSubview:emailSubjectLine];
    //end email subject ----------------------------------------------------------------------
    
    
    //email time and if flagged as email read ------------------------------------------------
    emailTimeLine = [[UILabel alloc] initWithFrame:CGRectMake(screenWidth-66, 12, 60, 21)];
    emailTimeLine.tag = EMAIL_TIME_TAG;
    emailTimeLine.font = [UIFont systemFontOfSize:14.0f];
    emailTimeLine.numberOfLines = 1;
    emailTimeLine.text = _emailContentList[row][EMAIL_VIEW_TIME];
    emailTimeLine.textAlignment = NSTextAlignmentRight;
    // change background color and time color if the email has been read
    if ([_emailContentList[row][EMAIL_VIEW_READ] isEqual: @true])
    {
        
        cell.contentView.backgroundColor = _grayBackgroundAppColor;
        emailTimeLine.textColor = _lightGrayAppColor;
        
    }
    else
    {
        emailTimeLine.textColor = [UIColor blackColor];
    }
    
    [cell.contentView addSubview:emailTimeLine];
    //end email time -------------------------------------------------------------------------
    
    
    //email preview --------------------------------------------------------------------------
    emailPreview = [[UILabel alloc] initWithFrame:CGRectMake(9, 49, screenWidth-15, 35)];
    emailPreview.tag = EMAIL_PREVIEW_TAG;
    emailPreview.textColor = _mediumGrayAppColor;
    emailPreview.font = [UIFont systemFontOfSize:14.0f];
    emailPreview.numberOfLines = 2;
    emailPreview.text=_emailContentList[row][EMAIL_VIEW_PREVIEW];
    CGSize labelSize = [emailPreview.text sizeWithFont:emailPreview.font
                                constrainedToSize:emailPreview.frame.size
                                    lineBreakMode:UILineBreakModeWordWrap];
    CGFloat labelHeight = labelSize.height;
    if(labelHeight<18) //adjust y location if only one line of text in the preview
    {
        CGRect labelFrame = [emailPreview frame];
        labelFrame.origin.y = 40;
        [emailPreview setFrame:labelFrame];
    }
    [cell.contentView addSubview:emailPreview];
    // end email preview ---------------------------------------------------------------------
    
    
    //email read and unread ------------------------------------------------------------------
    emailReadUnread = [[UILabel alloc] initWithFrame:CGRectMake(xpos+xpos2, 12, 164, 21)];
    emailReadUnread.tag = EMAIL_UNREAD_TAG;
    emailReadUnread.attributedText = emailReadString;
    emailReadUnread.font = [UIFont systemFontOfSize:14.0f];
    [cell.contentView addSubview:emailReadUnread];
    //end email read and unread --------------------------------------------------------------
    
    
    //email avatar ---------------------------------------------------------------------------
    UIImageView *emailAvatar = [[UIImageView alloc] initWithFrame:CGRectMake(9, 9, 36, 36)];
    NSString *newURL = _emailContentList[row][EMAIL_VIEW_AVATAR];
    NSURL *gravatarURL = [GravatarHelper getGravatarURL:newURL];
    NSData *imageData = [NSData dataWithContentsOfURL:gravatarURL];
    
    if(imageData !=nil)
    {
        emailAvatar.image = [UIImage imageWithData:imageData];
        emailAvatar.layer.cornerRadius = AVATAR_CORNER_RADIUS;
        emailAvatar.layer.masksToBounds = YES;
    [cell.contentView addSubview: emailAvatar];
    }
    else
    {
        
        CGRect avatarFrame = [emailSubjectLine frame];
        avatarFrame.origin.x=9;
        [emailSubjectLine setFrame:avatarFrame];
        avatarFrame = [emailReadUnread frame];
        avatarFrame.origin.x=9+xpos2;
        [emailReadUnread setFrame: avatarFrame];
        if(xpos2>0)
        {
            avatarFrame = [dotImgView frame];
            avatarFrame.origin.x = 9;
            [dotImgView setFrame:avatarFrame];
        }
    }
    //end email avatar -----------------------------------------------------------------------
    
    
    //email account flag ---------------------------------------------------------------------
    emailAccountFlag = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 8, 20)];
    emailAccountFlag.image = [UIImage imageNamed:_emailContentList[row][EMAIL_VIEW_ACCOUNT_FLAG]];
    [cell.contentView addSubview:emailAccountFlag];
    //end email account flag -----------------------------------------------------------------
    
    
    //email longpress overlay ----------------------------------------------------------------
    CGRect  viewRect = CGRectMake(0, 0, screenWidth, 98);
    UIView* longpressView = [[UIView alloc] initWithFrame:viewRect];
    longpressView.backgroundColor = _mediumGrayAppColor;
    longpressView.tag = 100*row+EMAIL_LONGPRESS_VIEW_TAG;
    longpressView.alpha = 0.0f;
    
    int boxes = screenWidth/4;
    int padding = (boxes-36)/2;
    
    UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(padding, 20, 36, 36)];
    imgView.image = [UIImage imageNamed:@"Trash@2x.png"];
    [longpressView addSubview: imgView];
    imgView = [[UIImageView alloc] initWithFrame:CGRectMake(padding+boxes, 20, 36, 36)];
    imgView.image = [UIImage imageNamed:@"Spam@2x.png"];
    [longpressView addSubview: imgView];
    imgView = [[UIImageView alloc] initWithFrame:CGRectMake(padding+(boxes*2), 20, 36, 36)];
    imgView.image = [UIImage imageNamed:@"LabelHome@2x.png"];
    [longpressView addSubview: imgView];
    imgView = [[UIImageView alloc] initWithFrame:CGRectMake(padding+(boxes*3), 20, 36, 36)];
    imgView.image = [UIImage imageNamed:@"LinkHome@2x.png"];
    [longpressView addSubview: imgView];
    //draw the text labels for the icons
    UILabel  * label = [[UILabel alloc] initWithFrame:CGRectMake(0, 60, boxes, 16)];
    label.text = @"Delete";
    label.textAlignment = NSTextAlignmentCenter;
    label.textColor = [UIColor colorWithRed:255/255.0f green:255/255.0f blue:255/255.0f alpha:1.0f];
    [longpressView addSubview: label];
    label = [[UILabel alloc] initWithFrame:CGRectMake(boxes, 60, boxes, 16)];
    label.text = @"Spam";
    label.textAlignment = NSTextAlignmentCenter;
    label.textColor = [UIColor colorWithRed:255/255.0f green:255/255.0f blue:255/255.0f alpha:1.0f];
    [longpressView addSubview: label];
    label = [[UILabel alloc] initWithFrame:CGRectMake(boxes*2, 60, boxes, 16)];
    label.text = @"Label";
    label.textAlignment = NSTextAlignmentCenter;
    label.textColor = [UIColor colorWithRed:255/255.0f green:255/255.0f blue:255/255.0f alpha:1.0f];
    [longpressView addSubview: label];
    label = [[UILabel alloc] initWithFrame:CGRectMake(boxes*3, 60, boxes, 16)];
    label.text = @"Link";
    label.textAlignment = NSTextAlignmentCenter;
    label.textColor = [UIColor colorWithRed:255/255.0f green:255/255.0f blue:255/255.0f alpha:1.0f];
    [longpressView addSubview: label];
    
    [cell.contentView addSubview:longpressView];
    //end longpress overlay ------------------------------------------------------------------
    
    //long press --------------------------------------------------------------------------
    UILongPressGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(handleLongPress:)];
    longPress.minimumPressDuration = 0.4;
    [cell addGestureRecognizer:longPress];
    //end long press ------------------------------------------------------------------------
    
    // taps
    UITapGestureRecognizer *tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapped:)];
    [cell addGestureRecognizer:tapRecognizer];
    
    //end taps
    return cell;
}

- (void) tapped: (UIGestureRecognizer *)taps
{
    
    int theCurrentCell = [self getCurrentlySelectedListCell];
    CGPoint p = [taps locationInView:self.tableView];
    NSIndexPath *indexPath = [self.tableView indexPathForRowAtPoint:p];
    
    // a new cell was tapped when a cell was already in long hold
    if(theCurrentCell > -1 && theCurrentCell != indexPath.row)
    {
        NSIndexPath *indexPath2 = [self getCurrentlySelectedListCellPath];
        [self updateLongpressView:indexPath2];
        
    }
    //is tapping inside a cell in longpress handle menu
    else if(theCurrentCell == indexPath.row)
    {
        
        int pointPressed = p.x, boxes=[UIScreen mainScreen].bounds.size.width/4,section=0;
        if(pointPressed<=boxes){section=1;} //delete
        else if(pointPressed >boxes && pointPressed<=(boxes*2)){section=2;}//spam
        else if(pointPressed >boxes && pointPressed<=(boxes*3)){section=3;}//label
        else {section=4;}//link
        UIAlertView* mes=[[UIAlertView alloc] initWithTitle:@"LONG HOLD REVISITED" message:[NSString stringWithFormat:@"area %i is was tapped in longpress mode", section] delegate:self cancelButtonTitle:@"Ok" otherButtonTitles: nil];
        [mes show];
    }
    //a cell was tapped when no cell was in longpress mode
    else
    {
       
       
    }

}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //static NSString *CellIdentifier = @"emailTableCellController";
    EmailListCell *cell = (EmailListCell *)[(UITableView *)self.view cellForRowAtIndexPath:indexPath];
    int theCurrentCell = [self getCurrentlySelectedListCell];
    }




@end
