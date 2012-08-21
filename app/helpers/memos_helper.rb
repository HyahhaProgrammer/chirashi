require 'uri'

module MemosHelper
  def replace_uri(s)
    str = s.dup
    uri_reg = URI.regexp(%w[http https])
    str.gsub!(uri_reg) {%Q{<a href="#{$&}" target="_blank">#{$&}</a>}}
    return str
  end
end
