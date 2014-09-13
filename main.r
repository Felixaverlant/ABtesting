same_conv <- function(visits_a,visits_b,conversions_a,conversions_b){
	# Probability that the two versions have the same conversion rate as (in %).
	total_visits <- visits_a + visits_b
	conv_rate_a <- sum(conversions_a / visits_a)*100
	conv_rate_b <- sum(conversions_b / visits_b)*100

	P <- ((conversions_a + conversions_b)/(visits_a + visits_b))
	Q <- sum(1 - P)
	z <- ((((conv_rate_a)/100) - (conv_rate_b)/100)*sqrt((total_visits-1)/total_visits)/(sqrt(P*Q*((1/visits_a)+(1/visits_b)))))
	p_val <- (1 - pnorm(z))*2

	round(p_val*100, digits=2)
}

conv_interval <- function(conf_interval,visits_a,visits_b,conversions_a,conversions_b){
	# Return the lowest & highest conversion rates based on a confidence interval set (in %). 
	z_val <- qnorm((conf_interval + 1)/2)

	padja <- (conversions_a + (z_val^2)/4) / (visits_a + (z_val^2)/2)
	padjb <- (conversions_b + (z_val^2)/4) / (visits_b + (z_val^2)/2)

	low  <- (padja - padjb) - z_val * sqrt((padja*(1-padja))/(visits_a + (z_val^2)/2)+ (padjb*(1-padjb)/ (visits_b + (z_val^2)/2 )))
	high <- (padja - padjb) + z_val * sqrt((padja*(1-padja))/(visits_a + (z_val^2)/2)+ (padjb*(1-padjb)/ (visits_b + (z_val^2)/2 )))	

	list("low"=round(low*100, digits=2), "high"=round(high*100, digits=2))
}