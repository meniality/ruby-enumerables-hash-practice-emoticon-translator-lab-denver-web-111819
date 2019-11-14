require "yaml"

def load_library(file)
  emoticons = YAML.load_file(file)
  
  new_hash = {
    :get_meaning => {},
    :get_emoticon => {}
  }
  
  emoticons.each do |key, value|
    new_hash[:get_meaning][value[1]] = key
    new_hash[:get_emoticon][value[0]] = emoticons[key][1]
  end
  new_hash
end

def get_japanese_emoticon(file, english_emoticon)
  emoticons = load_library(file)
  
  if emoticons[:get_emoticon][english_emoticon] 
    return emoticons[:get_emoticon][english_emoticon]
  else 
    return "Sorry, that emoticon was not found"
  end
  
end

def get_english_meaning(file, jap_emoticon)
  meaning = load_library(file)[:get_meaning][jap_emoticon]
  meaning ? meaning: "Sorry, that emoticon was not found"
  
end