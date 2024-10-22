require "sinatra"
require "sinatra/reloader"

get("/") do
  erb(:new_square_calc)
end

get("/square/new") do
  erb(:new_square_calc)
end

get("/square/results") do

  @the_num= params.fetch("number")

  @the_result = @the_num.to_f**2
  erb(:square_results)
end

get("/square_root/new") do
  erb(:new_square_root_calc)
end

get("/square_root/results") do

  @user_num_sqrt = params.fetch("user_number")

  @sqrt_result = @user_num_sqrt.to_f**0.5
  erb(:square_root_results)
end

get("/random/new") do
  erb(:random_new)
end

get("/random/results") do

  @min = params.fetch("user_min").to_f
  @max = params.fetch("user_max").to_f
  @random_num = rand(@min..@max)
  erb(:random_results)
end

get("/payment/new") do
  erb(:payment_new)
end

get("/payment/results") do

  @apr = params.fetch("user_apr").to_f
  @num_yrs = params.fetch("user_years").to_i
  @principal = params.fetch("user_pv").to_i

  @r = (@apr/100)/12
  @n = @num_yrs.to_i*12
  @numerator = @r * @principal
  @denominator = 1-((1+@r)**(-@n))
  @payment_calc = @numerator / @denominator

  erb(:payment_results_calc)
end
