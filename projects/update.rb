#!/usr/bin/env ruby

# for i in "$HOME/httpdocs/projects/"*; do
#   cd "$i"
#   git pull 2>&1
#   git submodule init 2>&1
#   git submodule update 2>&1
# done

require "net/http"
require "uri"
require "cgi"


USERNAME = 'subtlegradient'
TOKEN = ''
BASEURL = "http://test.mootools.net/"



def get_url(projectpath)
  # return "http://"
  # http://home.subtlegradient.com:4008/?client_id=&state=addjob&job_name=name&user=myname&auth=token&max=1&browsers=all&suites%5B%5D=foo&urls%5B%5D=http%3A%2F%2Furl&suites%5B%5D=foo1&urls%5B%5D=http%3A%2F%2Furl1&suites%5B%5D=&urls%5B%5D=http%3A%2F%2F&suites%5B%5D=&urls%5B%5D=http%3A%2F%2F&suites%5B%5D=&urls%5B%5D=http%3A%2F%2F&suites%5B%5D=&urls%5B%5D=http%3A%2F%2F&suites%5B%5D=&urls%5B%5D=http%3A%2F%2F&suites%5B%5D=&urls%5B%5D=http%3A%2F%2F&suites%5B%5D=&urls%5B%5D=http%3A%2F%2F&suites%5B%5D=&urls%5B%5D=http%3A%2F%2F&suites%5B%5D=&urls%5B%5D=http%3A%2F%2F&suites%5B%5D=&urls%5B%5D=http%3A%2F%2F&suites%5B%5D=&urls%5B%5D=http%3A%2F%2F
  
  url = BASEURL
  first = true
  
  parts = [
    {'state'    => 'addjob'},
    {'user'     => USERNAME},
    {'auth'     => TOKEN},
    {'max'      => 1},
    {'browsers' => 'all'},
  ]
  # parts = {
  #   'state'    => 'addjob',
  #   'user'     => USERNAME,
  #   'auth'     => TOKEN,
  #   'max'      => 1,
  #   'browsers' => 'all',
  #   
  #   'suites' => [],
  #   'urls' => [],
  # }
  
  case projectpath
  when /core$/
    # parts['job_name'] = 'Core Edge'
    # parts['suites'] << 'Core Edge Specs'
    # parts['urls'] << 'http://test.mootools.net/projects/core/Specs/?script=http://test.mootools.net/js/inject.js'
    
    parts << ({ 'job_name' => 'Core Edge'})
    parts << ({ 'suites[]' => 'Core Edge' })
    parts << ({ 'urls[]'   => 'http://test.mootools.net/projects/core/Specs/?script=http://test.mootools.net/js/inject.js' })

  when /more$/
    # parts['job_name'] = 'More Edge'
    # parts['suites'] <<  'More Edge Specs'
    # parts['urls'] <<  'http://test.mootools.net/projects/more/Specs/?script=http://test.mootools.net/js/inject.js'
    
    parts << ({ 'job_name' => 'More Edge'})
    parts << ({ 'suites[]' => 'More Edge' })
    parts << ({ 'urls[]'   => 'http://test.mootools.net/projects/more/Specs/?script=http://test.mootools.net/js/inject.js' })

  when /slick$/
    # parts['job_name'] = 'Slick Edge'
    # parts['suites'] <<  "Browser Specs (test bug verifying)"
    # parts['urls'] <<  "http://test.mootools.net/projects/slick/test/specrunner_browser.html?script=http://test.mootools.net/js/inject.js"          
    # parts['suites'] <<  "Slick: Parser Specs"
    # parts['urls'] <<  "http://test.mootools.net/projects/slick/test/specrunner_SlickParser.html?script=http://test.mootools.net/js/inject.js"      
    # parts['suites'] <<  "Slick: Multiple Document Specs"
    # parts['urls'] <<  "http://test.mootools.net/projects/slick/test/specrunner_SlickDocs.html?script=http://test.mootools.net/js/inject.js"        
    # parts['suites'] <<  "Slick: Selector Specs (all doctypes)"
    # parts['urls'] <<  "http://test.mootools.net/projects/slick/test/specrunner_SlickSelect.html?script=http://test.mootools.net/js/inject.js"      
    # parts['suites'] <<  "Slick: Selector Mocks (all doctypes)"
    # parts['urls'] <<  "http://test.mootools.net/projects/slick/test/specrunner_SlickSelectMocks.html?script=http://test.mootools.net/js/inject.js" 
    # parts['suites'] <<  "Slick: Selector Specs Exhaustive (all doctypes)"
    # parts['urls'] <<  "http://test.mootools.net/projects/slick/test/specrunner_SlickExhaustive.html?script=http://test.mootools.net/js/inject.js"  
    # parts['suites'] <<  "Slick: Selector Specs (XML only)"
    # parts['urls'] <<  "http://test.mootools.net/projects/slick/test/specrunner_SlickXML.html?script=http://test.mootools.net/js/inject.js"         
    # parts['suites'] <<  "Slick: Match Specs"
    # parts['urls'] <<  "http://test.mootools.net/projects/slick/test/specrunner_SlickMatch.html?script=http://test.mootools.net/js/inject.js"       
    # parts['suites'] <<  "Slick: Slick Features"
    # parts['urls'] <<  "http://test.mootools.net/projects/slick/test/specrunner_SlickFeatures.html?script=http://test.mootools.net/js/inject.js"    
    
    parts << ({ 'job_name' => 'Slick Edge'})
    parts << ({ 'suites[]' => "Browser Specs (test bug verifying)" })
    parts << ({ 'urls[]'   => "http://test.mootools.net/projects/slick/test/specrunner_browser.html?script=http://test.mootools.net/js/inject.js"           })
    parts << ({ 'suites[]' => "Slick: Parser Specs" })
    parts << ({ 'urls[]'   => "http://test.mootools.net/projects/slick/test/specrunner_SlickParser.html?script=http://test.mootools.net/js/inject.js"       })
    parts << ({ 'suites[]' => "Slick: Multiple Document Specs" })
    parts << ({ 'urls[]'   => "http://test.mootools.net/projects/slick/test/specrunner_SlickDocs.html?script=http://test.mootools.net/js/inject.js"         })
    parts << ({ 'suites[]' => "Slick: Selector Specs (all doctypes)" })
    parts << ({ 'urls[]'   => "http://test.mootools.net/projects/slick/test/specrunner_SlickSelect.html?script=http://test.mootools.net/js/inject.js"       })
    parts << ({ 'suites[]' => "Slick: Selector Mocks (all doctypes)" })
    parts << ({ 'urls[]'   => "http://test.mootools.net/projects/slick/test/specrunner_SlickSelectMocks.html?script=http://test.mootools.net/js/inject.js"  })
    parts << ({ 'suites[]' => "Slick: Selector Specs Exhaustive (all doctypes)" })
    parts << ({ 'urls[]'   => "http://test.mootools.net/projects/slick/test/specrunner_SlickExhaustive.html?script=http://test.mootools.net/js/inject.js"   })
    parts << ({ 'suites[]' => "Slick: Selector Specs (XML only)" })
    parts << ({ 'urls[]'   => "http://test.mootools.net/projects/slick/test/specrunner_SlickXML.html?script=http://test.mootools.net/js/inject.js"          })
    parts << ({ 'suites[]' => "Slick: Match Specs" })
    parts << ({ 'urls[]'   => "http://test.mootools.net/projects/slick/test/specrunner_SlickMatch.html?script=http://test.mootools.net/js/inject.js"        })
    parts << ({ 'suites[]' => "Slick: Slick Features" })
    parts << ({ 'urls[]'   => "http://test.mootools.net/projects/slick/test/specrunner_SlickFeatures.html?script=http://test.mootools.net/js/inject.js"     })
  end
  
  parts.each do |pair|
    pair.each_pair do |key, value|
      
      url += '?' if first
      url += '&' unless first; first = false
      url += CGI::escape((key||'').to_s)
      url += '='
      url += CGI::escape((value||'').to_s)
      
    end
  end
  
  # p url
  # p [url,parts]
    # http://home.subtlegradient.com:4008/?
  # [url,{}]
  url
end



def doit!(projectpath)
  `git submodule init 2>&1; git submodule update 2>&1`
  
  url = get_url(projectpath)
  
  res = Net::HTTP.get_response( URI.parse(url) )
  # print res.body
  
  
end



Dir["#{ENV['HOME']}/httpdocs/projects/*"].each do |projectpath|
  next unless File.directory? projectpath
  
  cmd = "cd #{projectpath}; git pull 2>&1"
  result = `#{cmd}`
  
  # doit!(projectpath) unless result =~ /Already up-to-date/
  doit!(projectpath)
  
end
