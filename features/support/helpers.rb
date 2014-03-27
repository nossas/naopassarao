def to_url string
  return root_path if string == "the homepage"
  raise "I don't know the url '#{string}'"
end

def to_element string
  return ".slide-1" if string == "the first slide of content"
  return ".slide-2" if string == "the second slide of content"
  return ".slide-3" if string == "the third slide of content"
  raise "I don't know the element '#{string}'"
end
