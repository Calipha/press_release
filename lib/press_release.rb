require "press_release/version"

module PressRelease
  Key = "AIzaSyD-roliwX_RzA7-HvGzVfocxQen8QZvRQY"

  def all_translate text
    puts text
    get_languages.each do |lang|
      next if lang == 'en'
      puts translate text, :en, lang
    end
  end

  def get_languages
    unless @languages
      json = RestClient.get "https://www.googleapis.com/language/translate/v2/languages?key=#{Key}"
      data = JSON.parse json
      @languages = data["data"]["languages"].map{|a| a.values}.flatten
    else
      @languages
    end
  end

  def translate text, source = :en, target = :de
    text = CGI.escape text
    source = source.to_s
    target = target.to_s
    url = "https://www.googleapis.com/language/translate/v2?key=#{Key}&source=#{source}&target=#{target}&q=#{text}"

    json = RestClient.get url
    data = JSON.parse json
    translated = data['data']['translations'].first['translatedText']
    CGI.unescapeHTML translated
  end
end
