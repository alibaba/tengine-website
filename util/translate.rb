#!ruby

def parse_line(line) 
    line.gsub!(/<p><strong>(ngx_.*?_module)<\/strong><\/p>/, '<div class="module">\1</div>')
    line.gsub!(/<h1>Name<\/h1>/, '')
    line.gsub!(/<h1>(.*?)<\/h1>/, '<div class="dh">\1</div>')
    line.gsub!(/<h2>.*?<\/h2>/, '<br /><br />')
    line.gsub!(/<pre>/, '<pre class="mod_example">')

    return line
end


STDIN.each do |line|
    new = parse_line(line)
    puts new
end
