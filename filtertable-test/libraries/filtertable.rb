require 'inspec/utils/filter'

class Filtertable < Inspec.resource(1)
  name "filtertable"
  supports platform: "linux"

  # FilterTable setup
  filter_table = FilterTable.create
  # assign fields
  filter_table.register_column(:name, field: :name)
  filter_table.register_column(:age, field: :age)
  filter_table.register_column(:gender, field: :gender)
  filter_table.register_column(:toys, field: :toys)

  # custom matchers
  filter_table.register_custom_matcher(:has_car?) { |filter_table| filter_table.toys.flatten.include?('car') }
  filter_table.register_custom_matcher(:boy?)     { |filter_table| filter_table.gender.uniq.eql?(['boy']) }
  filter_table.register_custom_matcher(:girl?)    { |filter_table| filter_table.gender.uniq.eql?(['girl']) }
  
  # custom property
  filter_table.register_custom_property(:boys_count)  { |filter_table| filter_table.where(gender: 'boy').count }
  filter_table.register_custom_property(:girls_count) { |filter_table| filter_table.where(gender: 'girl').count }

  # bind to structured data
  filter_table.install_filter_methods_on_resource(self, :fetch_data)


  def fetch_data
    # This method should return an array of hashes - the raw data.  We'll hardcode it here.
    [
      { name: "Sarah", age: 12,  gender: "girl", toys: ['car','train','bike']},
      { name: "John",  age: 9,   gender: "boy",  toys: ['top','bike']},
      { name: "Donny", age: 10,  gender: "boy",  toys: ['bike','train','nintento']},
      { name: "Mary",  age: 12,  gender: "girl", toys: ['car','gameboy','bike']},
    ]
  end
end