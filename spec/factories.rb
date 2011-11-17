
Factory.define :valid_user do |u|
  u.name                  "Example User"
  u.email                 "example@user.com"
  u.password              "foobar"
  u.password_confirmation "foobar"
end

Factory.define :invalid_user do |u|
end

Factory.define :node do |n|
  n.title                 "Sample title"
  n.content               "Sample content"
end

Factory.define :edge do |e|
end