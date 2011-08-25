raise 'Best3 gem requires Ruby 1.9.2' unless RUBY_VERSION == '1.9.2'

%w(rubygems bundler/setup typhoeus nokogiri strscan ostruct digest/sha1 time openssl).each { |lib| require(lib) }

class Best3
  VERSION = '0.0.2'

  def initialize(*args)
    @key, @secret = args
    self
  end

  def s3()
    Wrapper.new('http://s3.amazonaws.com', @key, @secret)
  end

  def cloudfront()
    # cloudfront MUST use https
    Wrapper.new('https://cloudfront.amazonaws.com', @key, @secret)
  end

  class Wrapper
    def initialize(*args)
      @host, @key, @secret = args
      self
    end

    def call(request_method, uri, headers = {}, body = nil)
      _(request_method, uri, headers.clone, body)
    end

  private

    def _(request_method, uri, headers, body = nil)
      response = Typhoeus::Request.send(request_method.downcase, "#{@host}#{uri}", :headers => make_headers(request_method, uri, headers, body), :body => body)
      OpenStruct.new({:code => response.code, :headers => response.headers_hash, :body => Nokogiri::XML(response.body), :response => response})
    end

    def make_headers(request_method, uri, headers, body = nil)
      headers['Date'] = Time.now.rfc822
      headers['Authorization'] = make_auth(request_method, uri, headers, body)
      headers
    end

    def make_auth(request_method, uri, headers, body = nil)
      if @host == 'https://cloudfront.amazonaws.com'
        # cloudfront only requires HMAC of the date
        str = headers['Date']
      else
        str = []
        str << request_method
        str << ''
        str << '' if not headers['Content-Type'] # get requests require an empty line instead of the content type but on a put if you omit it it'll set application/x-download and expect that to be signed
        headers.keys.sort { |a, b| a.downcase <=> b.downcase }.each do |key|
          if key.match(/^x-amz/i) # convert special amz headers to expected format
            str << "#{key.downcase}:#{headers[key]}"
          else
            str << headers[key] # other headers just send the value
          end
        end
        if uri.include?('&')
          str << "#{StringScanner.new(uri).scan_until(/&/)[0..-2]}"
        else
          str << uri
        end
        str = str.join("\n").chomp
      end
      # auth key thingo stolen from aws::s3 library, lol.
      "AWS #{@key}:#{[OpenSSL::HMAC.digest(OpenSSL::Digest::Digest.new('sha1'), @secret, str)].pack('m').strip}"
    end
  end
end

def Best3(*args) # i miss _why.
  Best3.new(*args)
end
