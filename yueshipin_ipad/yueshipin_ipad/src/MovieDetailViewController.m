//
//  MovieDetailViewController.m
//  yueshipin_ipad
//
//  Created by joyplus1 on 12-11-20.
//  Copyright (c) 2012年 joyplus. All rights reserved.
//

#import "MovieDetailViewController.h"
#import "CommonHeader.h"
#import "MediaPlayerViewController.h"
#import "ProgramViewController.h"

#define LEFT_GAP 50

@interface MovieDetailViewController (){
    NSDictionary *video;
    NSMutableArray *commentArray;
    NSArray *episodeArray;
}

@end

@implementation MovieDetailViewController
@synthesize prodId;


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    [self setBgScrollView:nil];
    [self setPlaceholderImage:nil];
    [self setFilmImage:nil];
    [self setTitleImage:nil];
    [self setTitleLabel:nil];
    [self setScoreLabel:nil];
    [self setDoulanLogo:nil];
    [self setDirectorLabel:nil];
    [self setDirectorNameLabel:nil];
    [self setActorLabel:nil];
    [self setActorName1Label:nil];
    [self setPlayLabel:nil];
    [self setPlayTimeLabel:nil];
    [self setRegionLabel:nil];
    [self setRegionNameLabel:nil];
    [self setDingBtn:nil];
    [self setCollectionBtn:nil];
    [self setPlayBtn:nil];
    [self setShareBtn:nil];
    [self setWantBtn:nil];
    [self setAddListBtn:nil];
    [self setLineImage:nil];
    [self setIntroImage:nil];
    [self setIntroBgImage:nil];
    [self setIntroContentTextView:nil];
    [self setRelatedImage:nil];
    [self setCommentImage:nil];
    [self setNumberLabel:nil];
    [self setCommentBtn:nil];
    [self setDingNumberImage:nil];
    [self setCollectioNumber:nil];
    [self setPlayRoundBtn:nil];
    [self setDingNumberLabel:nil];
    [self setCollectionNumberLabel:nil];
    [self setRelatedBgImage:nil];
    [self setCloseBtn:nil];
    [super viewDidUnload];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.bgScrollView.frame = CGRectMake(0, 260, self.view.frame.size.width, self.view.frame.size.height);
    [self.bgScrollView setContentSize:CGSizeMake(self.view.frame.size.width, self.view.frame.size.height*1.5)];
    
    self.playBtn.frame = CGRectMake(290, 115, 185, 40);
    [self.playBtn setBackgroundImage:[UIImage imageNamed:@"play"] forState:UIControlStateNormal];
    [self.playBtn setBackgroundImage:[UIImage imageNamed:@"play_pressed"] forState:UIControlStateHighlighted];
    
    self.closeBtn.frame = CGRectMake(470, 20, 40, 42);
    [self.closeBtn setBackgroundImage:[UIImage imageNamed:@"cancel"] forState:UIControlStateNormal];
    [self.closeBtn setBackgroundImage:[UIImage imageNamed:@"cancel_pressed"] forState:UIControlStateHighlighted];
    
    self.placeholderImage.frame = CGRectMake(LEFT_GAP, 78, 217, 312);
    self.placeholderImage.image = [UIImage imageNamed:@"movie_frame"];
    
    self.filmImage.frame = CGRectMake(LEFT_GAP+6, 84, 203, 298);
    
    self.playRoundBtn.frame = CGRectMake(0, 0, 63, 63);
    [self.playRoundBtn setBackgroundImage:[UIImage imageNamed:@"play_btn"] forState:UIControlStateNormal];
    [self.playRoundBtn setBackgroundImage:[UIImage imageNamed:@"play_btn"] forState:UIControlStateHighlighted];
    [self.playRoundBtn addTarget:self action:@selector(playVideo) forControlEvents:UIControlEventTouchUpInside];
    
    self.playRoundBtn.center = self.filmImage.center;
    
    self.titleImage.frame = CGRectMake(LEFT_GAP, 35, 62, 26);
    self.titleImage.image = [UIImage imageNamed:@"detail_title"];
    
    self.titleLabel.frame = CGRectMake(290, 85, 130, 20);
    self.scoreLabel.frame = CGRectMake(420, 85, 35, 20);
    self.doulanLogo.frame = CGRectMake(462, 85, 15, 15);
    self.doulanLogo.image = [UIImage imageNamed:@"douban"];
    
    self.directorLabel.frame = CGRectMake(290, 180, 50, 15);
    self.directorNameLabel.frame = CGRectMake(335, 180, 140, 15);
    self.actorLabel.frame = CGRectMake(290, 220, 50, 15);
    self.actorName1Label.frame = CGRectMake(335, 220, 140, 15);
    self.actorName2Label.frame = CGRectMake(335, 245, 140, 15);
    self.actorName3Label.frame = CGRectMake(335, 270, 140, 15);

    self.playLabel.frame = CGRectMake(290, 300, 50, 15);
    self.playTimeLabel.frame = CGRectMake(335, 300, 100, 15);
    self.regionLabel.frame = CGRectMake(290, 333, 50, 15);
    self.regionNameLabel.frame = CGRectMake(335, 333, 100, 15);
    
    self.playBtn.frame = CGRectMake(290, 115, 185, 40);
    [self.playBtn setBackgroundImage:[UIImage imageNamed:@"play"] forState:UIControlStateNormal];
    [self.playBtn setBackgroundImage:[UIImage imageNamed:@"play_pressed"] forState:UIControlStateHighlighted];
    
    self.dingNumberImage.frame = CGRectMake(290, 360, 75, 24);
    self.dingNumberImage.image = [UIImage imageNamed:@"pushinguser"];
    self.dingNumberLabel.frame = self.dingNumberImage.frame;
    self.dingNumberLabel.text = @"1043人顶";
    
    self.collectioNumber.frame = CGRectMake(390, 360, 84, 24);
    self.collectioNumber.image = [UIImage imageNamed:@"collectinguser"];
    self.collectionNumberLabel.frame = self.collectioNumber.frame;
    self.collectionNumberLabel.text = @"1043人收藏";
    
    self.dingBtn.frame = CGRectMake(LEFT_GAP, 405, 55, 34);
    [self.dingBtn setBackgroundImage:[UIImage imageNamed:@"push"] forState:UIControlStateNormal];
    [self.dingBtn setBackgroundImage:[UIImage imageNamed:@"push_pressed"] forState:UIControlStateHighlighted];
    
    self.collectionBtn.frame = CGRectMake(115, 405, 74, 34);
    [self.collectionBtn setBackgroundImage:[UIImage imageNamed:@"collection"] forState:UIControlStateNormal];
    [self.collectionBtn setBackgroundImage:[UIImage imageNamed:@"collection_pressed"] forState:UIControlStateHighlighted];
    
    self.shareBtn.frame = CGRectMake(195, 405, 74, 34);
    [self.shareBtn setBackgroundImage:[UIImage imageNamed:@"share"] forState:UIControlStateNormal];
    [self.shareBtn setBackgroundImage:[UIImage imageNamed:@"share_pressed"] forState:UIControlStateHighlighted];
    
    self.wantBtn.frame = CGRectMake(290, 405, 76, 34);
    [self.wantBtn setBackgroundImage:[UIImage imageNamed:@"watch"] forState:UIControlStateNormal];
    [self.wantBtn setBackgroundImage:[UIImage imageNamed:@"watch_pressed"] forState:UIControlStateHighlighted];
    
    self.addListBtn.frame = CGRectMake(370, 405, 104, 34);
    [self.addListBtn setBackgroundImage:[UIImage imageNamed:@"listing"] forState:UIControlStateNormal];
    [self.addListBtn setBackgroundImage:[UIImage imageNamed:@"listing_pressed"] forState:UIControlStateHighlighted];
    
    self.lineImage.frame = CGRectMake(LEFT_GAP, 450, 430, 2);
    self.lineImage.image = [UIImage imageNamed:@"dividing"];
    
    self.introImage.frame = CGRectMake(LEFT_GAP, 460, 45, 20);
    self.introImage.image = [UIImage imageNamed:@"brief_title"];
    
    self.introBgImage.frame = CGRectMake(LEFT_GAP, 490, 440, 86);
    self.introBgImage.image = [UIImage imageNamed:@"brief"];
    
    self.introContentTextView.frame = CGRectMake(LEFT_GAP + 10, 500, 400, 58);
    self.relatedImage.frame = CGRectMake(LEFT_GAP, 585, 80, 20);
    self.relatedImage.image = [UIImage imageNamed:@"morelists_title"];
    
    self.relatedBgImage.frame = CGRectMake(LEFT_GAP, 620, 440, 86);
    self.relatedBgImage.image = [UIImage imageNamed:@"morelists"];
    
    self.commentImage.frame = CGRectMake(LEFT_GAP, 735, 74, 19);
    self.commentImage.image = [UIImage imageNamed:@"comment_title"];
    
    self.numberLabel.frame = CGRectMake(139, 736, 100, 18);
    
    self.commentBtn.frame = CGRectMake(410, 736, 66, 26);
    [self.commentBtn setBackgroundImage:[UIImage imageNamed:@"comment"] forState:UIControlStateNormal];
    [self.commentBtn setBackgroundImage:[UIImage imageNamed:@"comment_pressed"] forState:UIControlStateHighlighted];
    
}

- (void)viewWillAppear:(BOOL)animated
{
    if(video == nil){
        [self retrieveData];
    }
}

- (void)retrieveData
{
    NSString *key = [NSString stringWithFormat:@"%@%@", @"movie", self.prodId];
    id cacheResult = [[CacheUtility sharedCache] loadFromCache:key];
    if(cacheResult != nil){
        [self parseData:cacheResult];
    }
    if([[UIApplication sharedApplication].delegate performSelector:@selector(isParseReachable)]) {
        NSDictionary *parameters = [NSDictionary dictionaryWithObjectsAndKeys: self.prodId, @"prod_id", nil];
        [[AFServiceAPIClient sharedClient] getPath:kPathProgramView parameters:parameters success:^(AFHTTPRequestOperation *operation, id result) {
            [self parseData:result];
            [self showValues];
        } failure:^(__unused AFHTTPRequestOperation *operation, NSError *error) {
            [[NSNotificationCenter defaultCenter] postNotificationName:SHOW_MB_PROGRESS_BAR object:self userInfo:nil];
            [UIUtility showSystemError:self.view];
        }];
    } else {
        [[NSNotificationCenter defaultCenter] postNotificationName:SHOW_MB_PROGRESS_BAR object:self userInfo:nil];
    }
}

- (void)parseData:(id)result
{
    NSString *responseCode = [result objectForKey:@"res_code"];
    if(responseCode == nil){
        NSString *key = [NSString stringWithFormat:@"%@%@", @"movie", self.prodId];
        [[CacheUtility sharedCache] putInCache:key result:result];
        video = (NSDictionary *)[result objectForKey:@"movie"];
        episodeArray = [video objectForKey:@"episodes"];
        NSArray *tempArray = (NSMutableArray *)[result objectForKey:@"comments"];
        [commentArray removeAllObjects];
        if(tempArray != nil && tempArray.count > 0){
            [commentArray addObjectsFromArray:tempArray];
        }
        [[NSNotificationCenter defaultCenter] postNotificationName:SHOW_MB_PROGRESS_BAR object:self userInfo:nil];
    } else {
        [[NSNotificationCenter defaultCenter] postNotificationName:SHOW_MB_PROGRESS_BAR object:self userInfo:nil];
        [UIUtility showSystemError:self.view];
    }
}

- (void)showValues
{
    [self.filmImage setImageWithURL:[NSURL URLWithString:[video objectForKey:@"poster"]] placeholderImage:[UIImage imageNamed:@"video_placeholder"]];
    
    self.titleLabel.text = [video objectForKey:@"name"];
    self.scoreLabel.text = [NSString stringWithFormat:@"%@ 分", [video objectForKey:@"score"]];
    self.directorNameLabel.text = [video objectForKey:@"directors"];
    
    NSString *stars = [video objectForKey:@"stars"];
    NSArray *starArray;
    if([stars rangeOfString:@"/"].length > 0){
        starArray = [stars componentsSeparatedByString:@"/"];
    } else {
        starArray = [stars componentsSeparatedByString:@" "];
    }
    if(starArray.count > 0)
        self.actorName1Label.text = [((NSString *)[starArray objectAtIndex:0]) stringByReplacingOccurrencesOfString:@" " withString:@""];
    if(starArray.count > 1)
        self.actorName2Label.text = [((NSString *)[starArray objectAtIndex:1]) stringByReplacingOccurrencesOfString:@" " withString:@""];
    if(starArray.count > 2)
        self.actorName3Label.text = [((NSString *)[starArray objectAtIndex:2]) stringByReplacingOccurrencesOfString:@" " withString:@""];
    
    self.regionNameLabel.text = [video objectForKey:@"area"];
    self.playTimeLabel.text = [video objectForKey:@"publish_date"];
    self.dingNumberLabel.text = [NSString stringWithFormat:@"%@ 人顶", [video objectForKey:@"support_num"]];
    self.collectionNumberLabel.text = [NSString stringWithFormat:@"%@ 收藏", [video objectForKey:@"favority_num"]];
    
    self.introContentTextView.text = [video objectForKey:@"summary"];
}


- (void)playVideo
{
    if(![[UIApplication sharedApplication].delegate performSelector:@selector(isParseReachable)]){
        [UIUtility showNetWorkError:self.view];
        return;
    }
    [self playVideo:1];
}

- (void)playVideo:(NSInteger)num
{
    if(![[UIApplication sharedApplication].delegate performSelector:@selector(isWifiReachable)]){
        BlockAlertView *alert = [BlockAlertView alertWithTitle:@"" message:@"播放视频会消耗大量流量，您确定要在非WiFi环境下播放吗？"];
        [alert setCancelButtonWithTitle:NSLocalizedString(@"cancel", nil) block:nil];
        [alert setDestructiveButtonWithTitle:@"确定" block:^{
            [self willPlayVideo:num];
        }];
        [alert show];
    } else {
        [self willPlayVideo:num];
    }
}

- (void)willPlayVideo:(NSInteger)num
{
    NSArray *videoUrlArray = [[episodeArray objectAtIndex:num-1] objectForKey:@"down_urls"];
    if(videoUrlArray.count > 0){
        NSString *videoUrl = nil;
        for(NSDictionary *tempVideo in videoUrlArray){
            if([LETV isEqualToString:[tempVideo objectForKey:@"source"]]){
                videoUrl = [self parseVideoUrl:tempVideo];
                break;
            }
        }
        if(videoUrl == nil){
            videoUrl = [self parseVideoUrl:[videoUrlArray objectAtIndex:0]];
        }
        if(videoUrl == nil){
            [self showPlayWebPage];
        } else {
            MediaPlayerViewController *viewController = [[MediaPlayerViewController alloc]initWithNibName:@"MediaPlayerViewController" bundle:nil];
            viewController.videoUrl = videoUrl;
            [self presentModalViewController:viewController animated:YES];
        }
    }else {
        [self showPlayWebPage];
    }
}

- (void)showPlayWebPage
{
    ProgramViewController *viewController = [[ProgramViewController alloc]initWithNibName:@"ProgramViewController" bundle:nil];
    NSArray *urlArray = [video objectForKey:@"video_urls"];
    viewController.programUrl = [[urlArray objectAtIndex:0] objectForKey:@"url"];
    viewController.title = [video objectForKey:@"name"];
    viewController.view.frame = CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height);
    [[AppDelegate instance].rootViewController.stackScrollViewController addViewInSlider:viewController invokeByController:self isStackStartView:FALSE];
}

@end
