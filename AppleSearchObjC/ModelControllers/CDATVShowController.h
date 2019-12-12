//
//  CDATVShowController.h
//  AppleSearchObjC
//
//  Created by Chris Anderson on 12/6/19.
//  Copyright © 2019 Renaissance Apps. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CDATVShow.h"
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CDATVShowController : NSObject

+ (void) fetchTVShowsFromSearch: (NSString *)searchTerm completion: (void (^) (NSArray<CDATVShow *> *shows, NSError *error))completion;

+ (void) fetchImageForTVShow: (CDATVShow *)show completion: (void (^) (UIImage *image))completion;

@end

NS_ASSUME_NONNULL_END
