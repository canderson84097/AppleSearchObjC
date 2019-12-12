//
//  CDAMovieController.h
//  AppleSearchObjC
//
//  Created by Chris Anderson on 12/5/19.
//  Copyright © 2019 Renaissance Apps. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CDAMovie.h"
@class UIImage;

NS_ASSUME_NONNULL_BEGIN

@interface CDAMovieController : NSObject

+ (void) fetchMoviesFromSearch: (NSString *)searchTerm completion: (void (^)(NSArray<CDAMovie *> *movies, NSError *error))completion;

+ (void) fetchImageForMovie: (CDAMovie *)movie completion: (void (^) (UIImage *image))completion;

@end

NS_ASSUME_NONNULL_END
