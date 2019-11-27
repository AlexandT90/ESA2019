# set a seed to make sure we don't get ridiculous simulated values
set.seed(2019-11-27)

# simulate some data with the following attributes
n_sites <- 200
n_species <- 3

# we need some predictor variables
predictors <- data.frame(
  intercept = rep(1, n_sites),
  temperature_c = rnorm(n_sites, mean = 25, sd = 3),
  precipitation_mm = rnorm(n_sites, mean = 500, sd = 30),
  tree_cover_pc = runif(n_sites, min = 20, max = 80),
  flowering_pc = runif(n_sites, min = 0, max = 45)
)

# simulate some species-level associations with covariates
n_covariates <- ncol(predictors)
covariate_effects <- matrix(
  rnorm(n_species * n_covariates,
        mean = 0, sd = (1 / apply(predictors, 2, mean))),
  nrow = n_covariates,
  ncol = n_species
)
