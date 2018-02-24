//
//  GPUImageMultipleExposureFilter.m
//  ffmpeg_codec_demo
//
//  Created by jiang on 2018/2/24.
//  Copyright © 2018年 t. All rights reserved.
//

#import "GPUImageMultipleExposureFilter.h"

NSString *const kGPUImageMultipleExposureFragmentShader = SHADER_STRING
(
 varying highp vec2 textureCoordinate;
 varying highp vec2 textureCoordinate2;
 
 uniform sampler2D inputImageTexture;
 uniform sampler2D inputImageTexture2;
 
 void main() {
     mediump vec4 textureColor = texture2D(inputImageTexture, textureCoordinate);
     mediump vec4 textureColor2 = texture2D(inputImageTexture2, textureCoordinate2);
     mediump vec4 whiteColor = vec4(1.0);
     gl_FragColor = whiteColor - ((whiteColor - textureColor2) * (whiteColor - textureColor));
 }
);

@implementation GPUImageMultipleExposureFilter

- (instancetype)init {
    if (!(self = [super initWithFragmentShaderFromString:kGPUImageMultipleExposureFragmentShader]))
    {
        return nil;
    }
    return self;
}

@end
