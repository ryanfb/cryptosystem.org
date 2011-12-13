#!/usr/bin/env ruby

require 'rubygems'
require 'aws/s3'

def do_transfer?(remote,filename,bucket)
  begin
    if ((!AWS::S3::S3Object.exists?(remote, bucket)) || (File.mtime(filename) > Time.parse(AWS::S3::S3Object.find(remote,bucket).about['last-modified'])))
      return true
    end
  rescue
    return true
  end
  return false
end

AWS::S3::Base.establish_connection!(
  :access_key_id     => ENV['AMAZON_ACCESS_KEY_ID'],
  :secret_access_key => ENV['AMAZON_SECRET_ACCESS_KEY']
)

bucket = 'cryptosystem'

AWS::S3::Bucket.enable_logging_for(bucket)
Dir.glob("_site/**/*") do |filename|
  unless File.directory? filename
    remote = filename.sub(/^_site\//,'')
    if do_transfer?(remote,filename,bucket)
      puts filename + " -> " + remote
      
      options_hash = {:access => :public_read}.merge(
        (remote =~ /^archives\//) ? {:content_type => 'text/html'} : {}
      )
      AWS::S3::S3Object.store(
        remote,
        open(filename),
        bucket,
        options_hash
      )

      if remote =~ /^archives\//
        AWS::S3::S3Object.store(
          remote + '/',
          open(filename),
          bucket,
          options_hash
        )
      end
    end
  end
end
AWS::S3::Bucket.disable_logging_for(bucket)
