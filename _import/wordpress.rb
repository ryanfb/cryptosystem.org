require 'rubygems'
require 'sequel'
require 'fileutils'
require 'yaml'

# NOTE: This converter requires Sequel and the MySQL gems.
# The MySQL gem can be difficult to install on OS X. Once you have MySQL
# installed, running the following commands should work:
# $ sudo gem install sequel
# $ sudo gem install mysql -- --with-mysql-config=/usr/local/mysql/bin/mysql_config

module Jekyll
  module WordPress

    # Reads a MySQL database via Sequel and creates a post file for each
    # post in wp_posts that has post_status = 'publish'.
    # This restriction is made because 'draft' posts are not guaranteed to
    # have valid dates.
    QUERY = "select post_title, post_name, post_date, post_content, post_excerpt, ID, guid from wp_posts where post_status = 'publish' and post_type = 'post'"

    def self.process(dbname, user, pass, host = 'localhost')
      db = Sequel.mysql(dbname, :user => user, :password => pass, :host => host, :encoding => 'utf8')

      FileUtils.mkdir_p "_posts"

      db[QUERY].each do |post|
        # Get required fields and construct Jekyll compatible name
        title = post[:post_title]
        slug = post[:post_name]
        date = post[:post_date]
        content = post[:post_content]
        name = "%02d-%02d-%02d-%s.markdown" % [date.year, date.month, date.day,
                                               slug]

        comment_query = "select comment_author, comment_date, comment_content from wp_comments where comment_approved = 1 and comment_post_ID = #{post[:ID]}"
        
        # Get the relevant fields as a hash, delete empty fields and convert
        # to YAML for the header
        data = {
           'layout' => 'post',
           'title' => title.to_s,
           'excerpt' => post[:post_excerpt].to_s,
           'wordpress_id' => post[:ID],
           'wordpress_url' => post[:guid],
           'permalink' => "archives/%02d/%02d/%s" % [date.year, date.month, slug],
           'comments' => db[comment_query].all.map{|c| c[:comment_content] = c[:comment_content].to_s; c[:comment_author] = c[:comment_author].to_s; c}
         }.delete_if { |k,v| v.nil? || v == ''}.to_yaml
        
        # Write out the data and content to file
        File.open("_posts/#{name}", "w") do |f|
          f.puts data
          f.puts "---"
          f.puts content
          
          # if db[comment_query].count > 0
          #   f.puts '<div class="comments">'
          #     f.puts '<ul>'
          #     db[comment_query].each do |comment|
          #       f.puts "<li/><span class=\"author\">%s</span> <span class=\"date\">%02d/%02d/%02d</span> <span class=\"comment\">%s</span>" % [comment[:comment_author], comment[:comment_date].year, comment[:comment_date].month, comment[:comment_date].day, comment[:comment_content]]
          #     end
          #     f.puts '</ul>'
          #   f.puts '</div>'
          # end
        end
      end

    end
  end
end
