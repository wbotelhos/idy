# frozen_string_literal: true

guard :rspec, all_after_pass: false, all_on_start: false, cmd: :rspec do
  watch %r(^lib/(.+)\.rb$) do |m|
    "spec/#{m[1]}_spec.rb"
  end

  watch %r(^lib/(.+)\.rb$) do |m|
    "spec/#{m[1]}"
  end

  watch %r(^spec/.+_spec\.rb$)
end
