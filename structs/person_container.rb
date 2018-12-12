require "ostruct"
require 'json'

# Author: Roman Schmidt, Daniel Osterholz
class PersonContainer
  JSON_INPUT_FILE = 'person_in.json'
  JSON_OUTPUT_FILE = 'person_out.json'

  def initialize
    @person = []

    load_persons
  end

  def add_attribute_to_each_person(attr_name, value)
    @person.each_index do |index|
      add_attribute_to_person(index, attr_name, value)
    end
  end

  def to_s
    return_string = nil
    @person.each do |person|
      return_string += '; ' unless return_string.nil?
      return_string = '' if return_string.nil?
      return_string += person.to_h.to_s
    end
    return_string || ''
  end

  def add_attribute_to_person(key, attr_name, value)
    raise(ArgumentError, 'key is not an int') unless key.is_a?(Integer)
    raise(ArgumentError, 'attribute name is not a string') unless(attr_name.is_a?(String) || attr_name.is_a?(Symbol))

    person = @person[key]
    return false if person.nil?

    person[attr_name.to_sym] = value.dup
    true
  end

  def save
    temp_hash = []
    @person.each do |person|
      temp_hash.push(person.to_h)
    end

    File.open(JSON_OUTPUT_FILE, "w") do |f|
      f.write(JSON.pretty_generate(temp_hash))
    end
  end

  private

  def load_persons
    JSON.parse(File.read(JSON_INPUT_FILE).force_encoding(Encoding::UTF_8)).each {|person| add_person(person)}
  end

  def add_person(person)
    @person.push(OpenStruct.new(person))
  end
end

person_container = PersonContainer.new
person_container.add_attribute_to_each_person('is_person?', true)
person_container.add_attribute_to_person(1, 'loves_cookies', true)
person_container.add_attribute_to_person(2, :is_rich, true)

puts person_container

person_container.save