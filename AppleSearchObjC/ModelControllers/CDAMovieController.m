//
//  CDAMovieController.m
//  AppleSearchObjC
//
//  Created by Chris Anderson on 12/5/19.
//  Copyright © 2019 Renaissance Apps. All rights reserved.
//

// https://itunes.apple.com/search?term=fight+club

#import <UIKit/UIKit.h>
#import "CDAMovieController.h"
#import "CDAMovie.h"

static NSString *const baseURLString = @"https://itunes.apple.com/search";

// finalMovieURL = @"https://itunes.apple.com/search?term=fight+club&limit=25"

@implementation CDAMovieController

+ (void)fetchMoviesFromSearch: (NSString *)searchTerm completion:(void (^)(NSArray<CDAMovie *> * _Nonnull, NSError * _Nullable))completion
{
    NSURL *baseURL = [NSURL URLWithString:baseURLString];

    NSMutableArray<NSURLQueryItem *> *queryItems = [NSMutableArray new];

    NSURLQueryItem *searchTermQuery = [NSURLQueryItem queryItemWithName:@"term" value:searchTerm];
    
    NSURLQueryItem *entityQuery = [NSURLQueryItem queryItemWithName:@"entity" value:@"movie"];
    [queryItems addObject:searchTermQuery];
    [queryItems addObject:entityQuery];
    
    NSURLComponents *urlComponents = [[NSURLComponents alloc] initWithURL:baseURL resolvingAgainstBaseURL:true];
    
    [urlComponents setQueryItems:queryItems];
    
    NSURL *finalURL = [urlComponents URL];
    
    NSLog(@"%@", finalURL);
    
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
            
            NSMutableArray *movies = [NSMutableArray new];
            
            for (NSDictionary *movieDict in secondLevel)
            {
                CDAMovie *movie = [[CDAMovie alloc] initWithDictionary:movieDict];
                [movies addObject:movie];
            }
            completion(movies, nil);
        }
    }] resume];
}

+ (void) fetchImageForMovie:(CDAMovie *)movie completion:(void (^)(UIImage * _Nullable))completion
{
    NSURL *finalImageURL = [NSURL URLWithString:movie.moviePoster];
    NSLog(@"%@", finalImageURL);
    
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
