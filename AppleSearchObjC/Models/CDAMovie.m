//
//  CDAMovie.m
//  AppleSearchObjC
//
//  Created by Chris Anderson on 12/5/19.
//  Copyright © 2019 Renaissance Apps. All rights reserved.
//

#import "CDAMovie.h"

static NSString *const titleKey = @"trackName";
static NSString *const artworkKey = @"artworkUrl100";
static NSString *const releaseDateKey = @"releaseDate";
static NSString *const genreKey = @"primaryGenreName";
static NSString *const contentRatingKey = @"contentAdvisoryRating";
static NSString *const summaryKey = @"longDescription";

@implementation CDAMovie

- (instancetype) initWithMovieTitle:(NSString *)movieTitle moviePoster:(NSString *)moviePoster movieReleaseDate:(NSString *)movieReleaseDate movieGenre:(NSString *)movieGenre movieRating:(NSString *)movieRating movieSummary:(NSString *)movieSummary
{
    self = [super init];
    if (self)
    {
        _movieTitle = movieTitle;
        _moviePoster = moviePoster;
        _movieRealeaseDate = movieReleaseDate;
        _movieGenre = movieGenre;
        _movieRating = movieRating;
        _movieSummary = movieSummary;
    }
    return self;
}

@end

@implementation CDAMovie (JSONConvertable)

- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    NSString *movieTitle = dictionary[titleKey];
    NSString *moviePoster = dictionary[artworkKey];
    NSString *movieReleaseDate = dictionary[releaseDateKey];
    NSString *movieGenre = dictionary[genreKey];
    NSString *movieRating = dictionary[contentRatingKey];
    NSString *movieSummary = dictionary[summaryKey];
    
    return [self initWithMovieTitle:movieTitle moviePoster:moviePoster movieReleaseDate:movieReleaseDate movieGenre:movieGenre movieRating:movieRating movieSummary:movieSummary];
}

@end
