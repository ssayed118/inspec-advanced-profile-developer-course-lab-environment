describe filtertable.where(name: /Donny|Sarah/ ) do
  it { should have_car }
end

describe filtertable.where(name: "Sarah") do
  it { should have_car }
  it { should be_girl }
  #it { should have_liked_red }
end

describe filtertable do
  its('girls_count') { should cmp 2 }
end

describe filtertable do
  its('boys_count') { should cmp 2 }
end

describe filtertable do
  its('Harvard_count') { should cmp 3 }
end
