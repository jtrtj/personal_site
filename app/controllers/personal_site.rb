require 'rack'

class PersonalSite
  def self.call(env)
    case env["PATH_INFO"]
    when '/' then index
    when '/about' then about
    else
      error
    end
  end

  def self.index
    ['200', {'Content-Type' => 'text/html'}, [File.read('./app/views/index.html')]]
  end

  def self.about
    render_view('about.html')
  end

  def self.error
    ['404', {'Content-Type' => 'text/html'}, [File.read('./app/views/error.html')]]
  end

  def self.render_view(page, code = '200')
    [code, {'Content-Type' => 'text/html'}, [File.read("./app/views/#{page}")]]
  end
end