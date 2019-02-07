# Firefox-html-launcher
launch html files are more

class Launcher


def initialize app_map 
  @app_map = app_map
end

def run file_name 
  application = select_app file_name 
  system "#{application} #{file_name}"  
end

def select_app file_name 
  ftype = file_type( file_name ).downcase
  @app_map[ ftype ]
end

def file_type file_name 
  File.extname( file_name ).gsub /^\./, '' 
end

end


def help
print "
You must pass in the path to the file to launch.

Usage: #{__FILE__} target_file
"
end


unless ARGV.size > 0
help
exit
end

app_map = {
 'html' => 'firefox',
 'rb' => 'gvim',
 'jpg' => 'gimp'
}

l = Launcher.new app_map 
target = ARGV.join ' ' 
l.run target 
