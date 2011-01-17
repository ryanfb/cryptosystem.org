--- 
permalink: archives/2006/03/libavcodec-libavformat-sample-code
wordpress_id: 19
layout: post
title: libavcodec / libavformat sample code
wordpress_url: http://www.cryptosystem.org/archives/2006/03/libavcodec-libavformat-sample-code/
---
Due to some changes in libavformat, the sample code at
[http://www.inb.uni-luebeck.de/~boehme/libavcodec_update.html](http://www.inb.uni-luebeck.de/~boehme/libavcodec_update.html) no longer
compiles correctly.

    avcodec_sample.0.4.9.cpp: In function â€˜int main(int, char**)â€™:
    avcodec_sample.0.4.9.cpp:83: error: request for member â€˜codec_typeâ€™ in 
        â€˜pFormatCtx->AVFormatContext::streams[i]->AVStream::codecâ€™, 
        which is of non-class type â€˜AVCodecContext*â€™
    avcodec_sample.0.4.9.cpp:92: error: cannot convert â€˜AVCodecContext**â€™ 
        to â€˜AVCodecContext*â€™ in assignment
    avcodec_sample.0.4.9.cpp:105: error: â€˜struct AVCodecContextâ€™ has 
        no member named â€˜frame_rateâ€™
    avcodec_sample.0.4.9.cpp:105: error: â€˜struct AVCodecContextâ€™ has 
        no member named â€˜frame_rate_baseâ€™
    avcodec_sample.0.4.9.cpp:106: error: â€˜struct AVCodecContextâ€™ has 
        no member named â€˜frame_rate_baseâ€™

I've created a [patch](http://cryptosystem.org/projects/libavcodec/avcodec_sample.patch) as well as a [fixed example](http://cryptosystem.org/projects/libavcodec/avcodec_sample.0.4.9-fixed.cpp) for the code. I'm not entirely sure about commenting out the frame rate correction hack, but those frame rate variables are no longer members of the AVCodecContext struct.

Also, for compiling under Debian, the recommended usage is not to change the include directives, but to use:

    g++ `ffmpeg-config --cflags` -o filename filename.cpp 
        `ffmpeg-config --libs avformat --libs avcodec`
