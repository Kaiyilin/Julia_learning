### A Pluto.jl notebook ###
# v0.12.4

using Markdown
using InteractiveUtils


# ╔═╡ 55cea598-0dc3-11eb-17df-1baefa18ab62
begin
	using Plots
	using CSV
	using DataFrames
	using Statistics
end

# ╔═╡ a53e1e18-0dc3-11eb-3767-0399bc37ae95
begin
	# Load the data first
	df = DataFrame(CSV.File("data1.csv"))
	
	# Since the timeline and price are 
	# ordered in reverse way,
	# shifting the data reversely
	time = df[1][end:-1:1]
	close_price = df[2][end:-1:1]
	
	# Plotting  
	plot(time, 
		 close_price, 
		 title = "tsmc_stock_price_overtime",
		 label = "Close_price" ,
		 xlabel = "month", 
		 xrotation = 45,
		 ylabel = "price",
		 legend= :topleft)
end

# ╔═╡ 7e709044-0e28-11eb-1769-fb17b4e0cc11
begin
	# Creating an equally weighted point
	x = LinRange(0, 1, length(close_price))
	plot(x, 
		 close_price, 
		 title = "tsmc_stock_price_overtime",
		 label = "Close_price",
		 xlabel = "Time_points", 
		 ylabel = "price",
		 legend= :topleft)
end

# ╔═╡ d36de732-0e2c-11eb-21cf-7d60a81c7792
begin 
	σ = std(close_price)
	σ
end

# ╔═╡ a363a84e-0ed9-11eb-175a-d7e3e25d95d3
begin
	# y = ax + b
	# using pseudoinverse matrix for solving linear eq
	constant = ones(length(x), 1) 
	X = hcat(constant, x)
	weight = inv(X'* X)* X' * close_price
end

# ╔═╡ 110b1d04-0e40-11eb-2df3-61804bc9b884
begin 
	y_weighted = X * weight
	plot(x, 
		 close_price, 
		 title = "tSMC_Stock_Price_Overtime",
		 label = "Close_price",
		 xlabel = "Time_points", 
		 ylabel = "Price",
		 legend= :bottomright)
	plot!(x, 
		  y_weighted,
		  label = "Fitted_Line")
end

# ╔═╡ 43eca058-0ee5-11eb-0cde-07ab0f31099a
begin 
	# Polynomial fitted line
	New_X = hcat(X, x.^2)
	weight_2 = inv(New_X'* New_X)* New_X' * close_price
	weight_2
end

# ╔═╡ f808ac9e-0ed1-11eb-07d6-75b254fb0651
"""

    mean_squared_cost(X, y, θ)

input with design matrix = X, target = y,  and the weights = θ

"""
begin
	function mean_squared_cost(X, y, θ) 

		# Sample size

		m = size(X)[1] 



		# Vectorised Prediction loss

		preds = X * θ 

		loss = preds - y 



		# Half mean squared loss

		cost = (1/(2m)) * (loss' * loss) 



		return cost 

	end
end

# ╔═╡ 2b8a947e-0ed2-11eb-3c67-ffbd59399597
begin 
"""

This function uses gradient descent algorithm to find the best weights (θ)

that minimises the mean squared loss between the predictions that the model

generates and the target vector (y).


"""

	function lin_reg_grad_descent(X, y, α, fit_intercept=true, n_iter=2000) 

		# Initialize some useful values

		m = length(y)



		if fit_intercept 

			# Add a constant

			constant = ones(m, 1) 
			# Creating a polynomial matrix

			X = hcat(constant, X,  X.^2, X.^3, X.^4)

		else

			X # Assume user added constants

		end



		# Use the number of features to initialise the theta θ vector

		n = size(X)[2] 

		θ = zeros(n) 



		# Initialise the cost vector based on the number of iterations

		loss = zeros(n_iter) 



		for iter in range(1, stop=n_iter) 

			pred = X * θ 


			# Calcaluate the cost for each iter

			loss[iter] = mean_squared_cost(X, y, θ) 



			# Update the theta θ at each iter

			θ = θ - ((α/m) * X') * (pred - y); 

		end

		return (θ, loss) 

	end
end


# ╔═╡ 55c5bb80-0ed2-11eb-0e0b-5736adadc362
begin
	θ, loss = lin_reg_grad_descent(x, close_price, 0.05, true, 2000) 

	
	# Plot the cost vector

	plot(loss, 

		label= "Cost per iter", 

		ylabel="Cost", 

		xlabel="Number of Iteration", 

		title="Cost Per Iteration")
end

# ╔═╡ 111e275c-0ed4-11eb-2618-4f00fb56d67d
function predict(X, θ, fit_intercept=true) 

    m = size(X)[1] 


    if fit_intercept 
		# Size shall be perfectly match

        constant = ones(m) 

        X = hcat(constant, X, X.^2, X.^3, X.^4) 
		

    else

        X 

    end


    predictions = X * θ 


    return predictions 

end

# ╔═╡ 73579a20-107a-11eb-268a-e311704d9458
begin
	predictions = predict(x, θ)
end

# ╔═╡ 91ce6e50-0ee5-11eb-1b8d-3da720e908c4
begin 
	y_weighted_2 = New_X * weight_2
	plot(x, 
		 close_price, 
		 title = "tSMC_Stock_Price_Overtime",
		 label = "Close_price",
		 xlabel = "Time_points", 
		 ylabel = "Price",
		 legend = :topleft)
	plot!(x, 
		  y_weighted,
		  label = "Linear_Fitted_Line")
	plot!(x,
		  y_weighted_2,
		  label = "Polynomial_Fitted_curve")
	plot!(x, 
		 predictions, 
		 label = "Polynomial_using_Gradient_decent")
end

# ╔═╡ Cell order:
# ╠═55cea598-0dc3-11eb-17df-1baefa18ab62
# ╠═a53e1e18-0dc3-11eb-3767-0399bc37ae95
# ╠═7e709044-0e28-11eb-1769-fb17b4e0cc11
# ╟─d36de732-0e2c-11eb-21cf-7d60a81c7792
# ╠═a363a84e-0ed9-11eb-175a-d7e3e25d95d3
# ╠═110b1d04-0e40-11eb-2df3-61804bc9b884
# ╠═43eca058-0ee5-11eb-0cde-07ab0f31099a
# ╠═f808ac9e-0ed1-11eb-07d6-75b254fb0651
# ╠═2b8a947e-0ed2-11eb-3c67-ffbd59399597
# ╠═55c5bb80-0ed2-11eb-0e0b-5736adadc362
# ╠═111e275c-0ed4-11eb-2618-4f00fb56d67d
# ╟─73579a20-107a-11eb-268a-e311704d9458
# ╠═91ce6e50-0ee5-11eb-1b8d-3da720e908c4
