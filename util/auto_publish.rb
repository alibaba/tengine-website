#!ruby
#
require 'digest/md5'

CHANGELOG_EN="CHANGES.te"
SVN_ADDR="http://code.taobao.org/svn/tengine/trunk/"
WEBSITE="http://tengine.taobao.org/"
TMP="/tmp/tengine-website/"


CHANGELOG_HTML="changelog.html"
INDEX_HTML="index.html"
DOWNLOAD_HTML="download.html"
DOWNLOAD_TAR="tengine.tar.gz"

base = String.new()
major = String.new()
minor = String.new()
date = String.new()
obase = String.new()
omajor = String.new()
ominor = String.new()
odate = String.new()

changelog_content = String.new()

system("mkdir -p #{TMP}");
system("wget -q #{SVN_ADDR}#{CHANGELOG_EN} -O #{TMP}#{CHANGELOG_EN}");

changelog_en = open("#{TMP}#{CHANGELOG_EN}")
unless changelog_en
    puts "Can't open the CHANGELOG.te file."
    exit 1
end

once = 0
list_tag = "\s\s\s\s\s\s<li>"

changelog_en.each do |line|
    m = line.match(/Changes with Tengine (\d+)\.(\d+)\.(\d+)[\s\t]+(.+)/)

    if m then
        break if once == 1

        once = 1
        base  = m[1]
        major = m[2]
        minor = m[3]
        date  = m[4]

        changelog_content = "\s\s\s\s<ul><a name=\"#{base}_#{major}_#{minor}\"></a><h4>Tengine-#{base}.#{major}.#{minor} [#{date}]</h4>\n"

        next
    end

    if line.match(/\*\)/) then
        changelog_content = changelog_content + line.strip.gsub(/\*\)/, list_tag)
        list_tag = "</li>\n\s\s\s\s\s\s<li>"
    else
        changelog_content = changelog_content + line.strip
    end
end

changelog_en.close

changelog_content = changelog_content + "</li>\n\s\s\s\s</ul>\n"

unless base
    puts "Can't find the release version number."
    exit 1
end

puts "#{base}-#{major}-#{minor}"
puts "#{date}"
puts "#{changelog_content}"

changelog_html = open("#{CHANGELOG_HTML}")
unless changelog_html
    puts "Can't open the changelog html."
    exit 1
end

tmp = open("#{TMP}#{CHANGELOG_HTML}", "w")
unless tmp 
    puts "Can't open the changelog tmp html."
    exit 1
end

changelog_html.each do |line|
    m = line.match(/(\d+)\.(\d+)\.(\d+)[\s\t]+\[(.+)\]/)
    if m then
        obase  = m[1]
        omajor = m[2]
        ominor = m[3]
        odate  = m[4]
        puts "#{obase}-#{omajor}-#{ominor}"
        puts "#{odate}"
        break
    end
end

#if base == obase and major == omajor and minor == ominor and date == odate then
    #puts "the changelog html has been updated."
    #exit 1
#end

changelog_html.rewind
once = 0

changelog_html.each do |line|
    m = line.match(/(\d+)\.(\d+)\.(\d+)[\s\t]+\[(.+)\]/)
    if m and once == 0 then
        once = 1
        line = changelog_content + line
    end

    tmp.puts line
end

changelog_html.close
tmp.close

index_html = open("#{INDEX_HTML}")
unless index_html
    puts "Can't open the index html."
    exit 1
end

tmp = open("#{TMP}#{INDEX_HTML}", "w")
unless tmp 
    puts "Can't open the index tmp html."
    exit 1
end

t = Time.now  
today = t.strftime("%m/%d/%Y") 

index_download = "\s\s\s\s<a href=\"download/tengine-#{base}.#{major}.#{minor}.tar.gz\"><img src=\"images/download.png\" onmouseover=\"this.src='images/download_a.png'\" onmouseout=\"this.src='images/download.png'\" /></a>\n"

index_news = "\s\s\s\s<li>[#{today}] <a href=\"download/tengine-#{base}.#{major}.#{minor}.tar.gz\">Tengine-#{base}.#{major}.#{minor}</a> is released (<a href=\"changelog.html##{base}_#{major}_#{minor}\">changes</a>).</li>\n"


news = 0

index_html.each do |line|
    m = line.match(/images\/download.png/)
    if m then
        line = index_download
    else
        m = line.match(/<h2>News<\/h2>/)
        if m then
            news = 1
        end
    end

    if news == 1 then
        m = line.match(/<ul>/)
        if m then
            news = 0
            line = line + index_news
        end
    end

    tmp.puts line
end

index_html.close
tmp.close

download_html = open("#{DOWNLOAD_HTML}")
unless download_html
    puts "Can't open the download html."
    exit 1
end

tmp = open("#{TMP}#{DOWNLOAD_HTML}", "w")
unless tmp 
    puts "Can't open the download tmp html."
    exit 1
end

system("wget -q #{WEBSITE}/download/tengine-#{base}.#{major}.#{minor}.tar.gz -O #{TMP}#{DOWNLOAD_TAR}");
tar = File.read("#{TMP}#{DOWNLOAD_TAR}")
unless tar
    puts "Can't read the download the tar package of tengine."
    exit 1
end

checksum = Digest::MD5.hexdigest(tar)
unless checksum
    puts "Bad checksum."
    exit 1
end

download_content="\s\s\s\s\s\s<li><a href=\"download/tengine-#{base}.#{major}.#{minor}.tar.gz\">Tengine-#{base}.#{major}.#{minor}.tar.gz</a><br/>\n\s\s\s\s\s\s<span class=\"md5\">MD5: #{checksum}</span></li>\n"
once = 0

download_html.each do |line|
    m = line.match(/download\/tengine-(\d+)\.(\d+)\.(\d+)/)
    if m and once == 0 then
        once = 1
        line = download_content + line
    end

    tmp.puts line
end

download_html.close
tmp.close

system("mv #{TMP}#{CHANGELOG_HTML} #{CHANGELOG_HTML}")
system("mv #{TMP}#{INDEX_HTML} #{INDEX_HTML}")
system("mv #{TMP}#{DOWNLOAD_HTML} #{DOWNLOAD_HTML}")
