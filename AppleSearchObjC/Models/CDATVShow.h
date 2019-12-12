//
//  CDATVShow.h
//  AppleSearchObjC
//
//  Created by Chris Anderson on 12/6/19.
//  Copyright © 2019 Renaissance Apps. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CDATVShow : NSObject

@property (nonatomic, readonly) NSString *tvShowTitle;
@property (nonatomic, readonly) NSString *tvShowSeason;
@property (nonatomic, readonly) NSNumber *tvShowNumberOfEpisodes;
@property (nonatomic, readonly) NSString *tvShowReleaseDate;
@property (nonatomic, readonly) NSString *tvShowPoster;
@property (nonatomic, readonly) NSString *tvShowRating;
@property (nonatomic, readonly) NSString *tvShowGenre;

- (instancetype) initWithTvShowTitle: (NSString *)tvShowTitle tvShowSeason: (NSString *)tvShowSeason tvShowReleaseDate: (NSString *)tvShowReleaseDate tvShowPoster: (NSString *)tvShowPoster tvShowRating: (NSString *)tvShowRating TvShowGenre: (NSString *)tvShowGenre tvShowNumberOfEpisodes: (NSNumber *)tvShowNumberOfEpisodes;

@end

@interface CDATVShow (JSONConvertable)

- (instancetype) initWithDictionary: (NSDictionary *)dictionary;

@end

NS_ASSUME_NONNULL_END
