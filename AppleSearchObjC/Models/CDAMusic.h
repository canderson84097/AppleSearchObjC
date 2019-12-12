//
//  CDAMusic.h
//  AppleSearchObjC
//
//  Created by Chris Anderson on 12/6/19.
//  Copyright © 2019 Renaissance Apps. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CDAMusic : NSObject

@property (nonatomic, readonly) NSString *artistName;
@property (nonatomic, readonly) NSString *albumTitle;
@property (nonatomic, readonly) NSURL *albumArtwork;

@end

NS_ASSUME_NONNULL_END
