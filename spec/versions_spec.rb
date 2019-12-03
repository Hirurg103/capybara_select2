['2.1.0', '3.5.4', '4.0.5'].each do |select2_version|
  Dir[File.join(__dir__, 'shared', '**', '*_spec.rb')].each do |spec|
    eval <<-RUBY, binding, __FILE__, __LINE__ + 1
      #{File.read(spec)}
    RUBY
  end
end
