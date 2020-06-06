#===== prepare =====
library(tidyverse)
data(iris)
iris %>% head()

#===== select =====
# column name
iris %>% select(Sepal.Length, Sepal.Width) %>% head()
iris %>% select(sl=Sepal.Length, sw=Sepal.Width) %>% head() # rename

# regexp
iris %>% select(matches("^Se")) %>% head()

# character vector
target = c("Sepal.Length", "Sepal.Width")
iris %>% select(any_of(target)) %>% head()

# `select(...)` and `select_at(vars(...))` are almost same.

#===== summarize (summarise) =====
# basic usage
iris %>% group_by(Species) %>% summarize(
    n=n(),
    min=min(Sepal.Length),
    med=median(Sepal.Length),
    max=max(Sepal.Length)
)

# summarise specific columns
iris %>% group_by(Species) %>% summarise_at(vars(matches("^Se")), mean)

# summarise all columns
iris %>% group_by(Species) %>% summarise_all(mean)

#===== mutate =====
# basic usage
iris %>% mutate(n=n()) %>% head()

# with `group_by()`
iris %>% group_by(Species) %>% mutate(n=n()) # it might be better to `ungroup()` explicitly.

# replace column
iris %>% mutate(Species=case_when(
    iris[["Species"]] == "setosa"     ~ 1,
    iris[["Species"]] == "versicolor" ~ 2,
    iris[["Species"]] == "virginica"  ~ 3,
    T ~ 0
)) %>% head()

#===== filter =====
# comming soon
