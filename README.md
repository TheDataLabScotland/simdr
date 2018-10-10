[![Build Status](https://travis-ci.org/rmnppt/simdr.svg?branch=master)](https://travis-ci.org/rmnppt/simdr)

# The Scottish Index of Multiple Deprivation in R

## Installation

You can install this package with

```{r}
devtools::install_github("rmnppt/simdr")
```

## Usage

You can load in the 2016 simd domain data as follows:

```{r}
data("simd16_domains")
```

Or you might want to view  the more granular indicator data:

```{r}
data("simd16_indicators")
```

If you want to analyse the data in the way that the SIMD team does you can start by:

 1. Selecting the indicator variables belonging to a domain
 2. Transform them  to be normally distributed
 3. Replace any missing values

Here is an example using education:

```{r}
library(dplyr)

normalised_education <- simd16_indicators %>% # start with the raw data
        select(Attendance, Attainment, Noquals, NEET, HESA) %>% # select relevant columns
        mutate(Attendance = normalScores(Attendance, forwards = FALSE)) %>% # replace each column
        mutate(Attainment = normalScores(Attainment, forwards = FALSE)) %>%
        mutate(Noquals    = normalScores(Noquals, forwards = TRUE)) %>%
        mutate(NEET       = normalScores(NEET, forwards = TRUE)) %>%
        mutate(HESA       = normalScores(HESA, forwards = FALSE)) %>%
        mutate_all(funs(replaceMissing)) # replace missing values
```

You will notice that the above gives a warning, there is some missing data. You may want to fill in the missing values, so we include a utility (`replaceMissing`) to replace missing and infinite values with 0, the center of the new normal distribution.

Notice that when we call `normalScores` we can decide whether a high value indicates deprivation or not, see `?normalScores` for more detail.

When combining the indicators to give a domain score, we need to apply a different weight to each. The weights are derived through factor analysis of the normalised indicator scores, and the proportional loadings on factor 1 serve as the weightings. We extract the loadings using the getFAWeights function as follows:

```{r}
education_weights <- getFAWeights(normalised_education)
```

Now that we have the normalised indicator scores and weights, we can combine them with the utility function `combineWeightsAndNorms`. Each normalised indicator variable is multiplied by its weight derived from factor analysis, as follows:

```{r}
education_score <- combineWeightsAndNorms(education_weights, normalised_education)
```

Finally we rank these weighted scores to generate the domain rank (1 = most deprived).

```{r}
education_rank <- rank(-education_score)
```

## Further Reading
    
Find more information about the openSIMD project here:

blog: [https://blogs.gov.scot/statistics/2017/05/23/opensimd/](https://blogs.gov.scot/statistics/2017/05/23/opensimd/)

documentation and examples: [http://www.gov.scot/Topics/Statistics/SIMD/analysis/openSIMD](http://www.gov.scot/Topics/Statistics/SIMD/analysis/openSIMD)

original repo: [https://github.com/TheDataLabScotland/openSIMD](https://github.com/TheDataLabScotland/openSIMD)
