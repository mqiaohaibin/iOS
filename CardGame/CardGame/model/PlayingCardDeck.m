//
//  PlayingCardDeck.m
//  CardGame
//
//  Created by qiaohaibin on 05/02/2017.
//  Copyright © 2017 qiaohaibin. All rights reserved.
//

#import "PlayingCardDeck.h"
#import "PlayingCard.h"

@implementation PlayingCardDeck

- (instancetype)init{
    self = [super init];
    
    if(self){
        for (NSString *suit in [PlayingCard validSuits]) {
            for (NSUInteger rank = 0; rank < [PlayingCard maxRank]; rank++) {
                PlayingCard *card = [[PlayingCard alloc] init];
                card.suit = suit;
                card.rank = rank + 1;
                [self addCard:card];
            }
        }
    }
    
    return self;
}

@end
