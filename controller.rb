require('sinatra')
require('sinatra/contrib/all')
require('pry-byebug')
require_relative('models/student')
require_relative('models/house')

#index
get "/students" do
  @students = Student.find_all()
  erb(:index)
end

#new
get "/students/new" do
  @houses = House.find_all()
  erb(:new)
end

#show
get "/students/:id" do
  @student = Student.find(params["id"].to_i)
  @house = House.find(params["id"].to_i)
  erb(:show)
end

#create
post "/students" do
  student = Student.new(params)
  student.save()
  redirect to("/students")
end