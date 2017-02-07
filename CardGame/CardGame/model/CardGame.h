//
//  CardGame.h
//  CardGame
//
//  Created by qiaohaibin on 06/02/2017.
//  Copyright © 2017 qiaohaibin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Deck.h"
#import "Card.h"

@interface CardGame : NSObject

@property (nonatomic, readonly) NSInteger score;

- (instancetype)initWithCardCount:(NSUInteger)cardCount usingDeck:(Deck *)deck;

- (void)chooseCardAtIndex:(NSUInteger)index;
- (Card *)cardAtIndex:(NSUInteger)index;

@end
