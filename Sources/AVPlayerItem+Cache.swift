//
//  AVPlayerItem+Cache.swift
//  VideoCache
//
//  Created by SoalHunag on 2019/2/22.
//  Copyright © 2019 soso. All rights reserved.
//

import AVFoundation
import ObjectiveC.runtime

extension AVPlayerItem {
    
    /// if cache key is nil, it will be filled by url.absoluteString's md5 string
    public convenience init(manager: VideoCacheManager = VideoCacheManager.default,
                            remote url: URL,
                            cacheKey key: VideoCacheKeyType? = nil,
                            cacheRanges: [VideoRange] = [VideoRange(0, VideoRangeBounds.max)]) {
        
        let `key` = key ?? url.absoluteString.videoCacheMD5
        
        let videoUrl = VURL(cacheKey: key, originUrl: url)
        manager.visit(url: videoUrl)
        
        let loaderDelegate = VideoResourceLoaderDelegate(manager: manager, url: videoUrl, cacheRanges: cacheRanges)
        let urlAsset = AVURLAsset(url: loaderDelegate.url.includeVideoCacheSchemeUrl, options: nil)
        urlAsset.resourceLoader.setDelegate(loaderDelegate, queue: .main)
        
        self.init(asset: urlAsset)
        canUseNetworkResourcesForLiveStreamingWhilePaused = true
        
        resourceLoaderDelegate = loaderDelegate
    }
    
    public func cacheCancel() {
        resourceLoaderDelegate?.cancel()
        resourceLoaderDelegate = nil
    }
}
