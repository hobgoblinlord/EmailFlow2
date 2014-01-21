//
//  GravatarHelper.h
//  EmailFlow2
//
//  Created by Noel Proulx on 1/19/14.
//  Copyright (c) 2014 Noel Proulx. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface GravatarHelper : NSObject {
    
}
+ (NSURL*) getGravatarURL:(NSString*) emailAddress;
@end
