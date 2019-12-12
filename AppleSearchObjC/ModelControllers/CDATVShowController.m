//
//  CDATVShowController.m
//  AppleSearchObjC
//
//  Created by Chris Anderson on 12/6/19.
//  Copyright © 2019 Renaissance Apps. All rights reserved.
//

// finalTVShowURL = https://itunes.apple.com/search?term=the+simpsons&entity=tvSeason

// finalTVShowEpisodeURL = https://itunes.apple.com/search?term=the+simpsons&entity=tvEpisode
// To get season episodes you need this URL https://itunes.apple.com/search?term=the+simpsons+"season"+"31(season number)"&entity=tvEpisode

// key word for tvshow episodes @"tvEpisode"

#import "CDATVShowController.h"

static NSString *const baseURLString = @"https://itunes.apple.com/search";

@implementation CDATVShowController

+ (void)fetchTVShowsFromSearch:(NSString *)searchTerm completion:(void (^)(NSArray<CDATVShow *> * _Nonnull, NSError * _Nullable))completion
{
    NSURL *baseURL = [NSURL URLWithString:baseURLString];
    
    NSMutableArray<NSURLQueryItem *> *queryItems = [NSMutableArray new];
    
    NSURLQueryItem *searchTermQuery = [NSURLQueryItem queryItemWithName:@"term" value:searchTerm];
    
    NSURLQueryItem *entityQuery = [NSURLQueryItem queryItemWithName:@"entity" value:@"tvSeason"];
    [queryItems addObject:searchTermQuery];
    [queryItems addObject:entityQuery];
    
    NSURLComponents *urlComponents = [[NSURLComponents alloc] initWithURL:baseURL resolvingAgainstBaseURL:true];
    
    [urlComponents setQueryItems:queryItems];
    
    NSURL *finalURL = [urlComponents URL];
    
    [[[NSURLSession sharedSession] dataTaskWithURL:finalURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error)
      {
        if (error)
        {
            NSLog(@"%@", error.localizedDescription);
            completion([NSArray new], error);
            return;
        }
        
        if (response)
        {
            NSLog(@"%@", response);
        }
        
        if (data)
        {
            NSDictionary *topLevel = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
            
            NSDictionary *secondLevel = topLevel[@"results"];
            
            NSMutableArray *shows = [NSMutableArray new];
            
            for (NSDictionary *showDict in secondLevel)
            {
                CDATVShow *show = [[CDATVShow alloc] initWithDictionary:showDict];
                [shows addObject:show];
            }
            completion(shows, nil);
        }
    }] resume];
}

+ (void)fetchImageForTVShow:(CDATVShow *)show completion:(void (^)(UIImage * _Nullable))completion
{
    NSURL *finalImageURL = [NSURL URLWithString:show.tvShowPoster];
    
    [[[NSURLSession sharedSession] dataTaskWithURL:finalImageURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error)
        {
            NSLog(@"There was an error:: %@", error.localizedDescription);
            completion(nil);
            return;
        }
        
        if (response)
        {
            NSLog(@"Response: %@", response);
        }
        
        if (!data)
        {
            NSLog(@"Error passing JSON for image: %@", error);
            completion(nil);
            return;
        }
        
        UIImage *image = [[UIImage alloc] initWithData: data];
        
        completion(image);
    }] resume];
}

@end
