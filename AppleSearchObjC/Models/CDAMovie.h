//
//  CDAMovie.h
//  AppleSearchObjC
//
//  Created by Chris Anderson on 12/5/19.
//  Copyright © 2019 Renaissance Apps. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CDAMovie : NSObject

@property (nonatomic, readonly, copy) NSString *movieTitle;
@property (nonatomic, readonly, copy) NSString *moviePoster;
@property (nonatomic, readonly, copy) NSString *movieRealeaseDate;
@property (nonatomic, readonly, copy) NSString *movieGenre;
@property (nonatomic, readonly, copy) NSString *movieRating;
@property (nonatomic, readonly, copy) NSString *movieSummary;

- (instancetype) initWithMovieTitle: (NSString *)movieTitle moviePoster: (NSString *)moviePoster movieReleaseDate: (NSString *)movieReleaseDate movieGenre: (NSString *)movieGenre movieRating: (NSString *)movieRating movieSummary: (NSString *)movieSummary;

@end

@interface CDAMovie (JSONConvertable)

- (instancetype) initWithDictionary: (NSDictionary *)dictionary;

@end

NS_ASSUME_NONNULL_END
