//
//  CDATVShow.m
//  AppleSearchObjC
//
//  Created by Chris Anderson on 12/6/19.
//  Copyright © 2019 Renaissance Apps. All rights reserved.
//

#import "CDATVShow.h"

@implementation CDATVShow

static NSString *const tvShowTitleKey = @"collectionName";
static NSString *const artworkKey = @"artworkUrl100";
static NSString *const releaseDateKey = @"releaseDate";
static NSString *const genreKey = @"primaryGenreName";
static NSString *const contentRatingKey = @"contentAdvisoryRating";
static NSString *const tvShowSeasonKey = @"collectionName";
static NSString *const tvShowNumberOfEpisodesKey = @"trackCount";

- (instancetype)initWithTvShowTitle:(NSString *)tvShowTitle tvShowSeason:(NSString *)tvShowSeason tvShowReleaseDate:(NSString *)tvShowReleaseDate tvShowPoster:(NSString *)tvShowPoster tvShowRating:(NSString *)tvShowRating TvShowGenre:(NSString *)tvShowGenre tvShowNumberOfEpisodes:(NSNumber *)tvShowNumberOfEpisodes
{
    self = [super init];
    if (self)
    {
        _tvShowTitle = [tvShowTitle copy];
        _tvShowSeason = [tvShowSeason copy];
        _tvShowReleaseDate = [tvShowReleaseDate copy];
        _tvShowPoster = [tvShowPoster copy];
        _tvShowRating = [tvShowRating copy];
        _tvShowGenre = [tvShowGenre copy];
        _tvShowNumberOfEpisodes = [tvShowNumberOfEpisodes copy];
        
    }
    return self;
}

@end

@implementation CDATVShow (JSONConvertable)

- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    NSString *tvShowTitle = dictionary[tvShowTitleKey];
    NSString *tvShowSeason = dictionary[artworkKey];
    NSString *tvShowReleaseDate = dictionary[releaseDateKey];
    NSString *tvShowPoster = dictionary[genreKey];
    NSString *tvShowRating = dictionary[contentRatingKey];
    NSString *tvShowGenre = dictionary[genreKey];
    NSNumber *tvShowNumberOfEpisodes = dictionary[tvShowNumberOfEpisodesKey];
    
    return [self initWithTvShowTitle:tvShowTitle tvShowSeason:tvShowSeason tvShowReleaseDate:tvShowReleaseDate tvShowPoster:tvShowPoster tvShowRating:tvShowRating TvShowGenre:tvShowGenre tvShowNumberOfEpisodes:tvShowNumberOfEpisodes];
}

@end
