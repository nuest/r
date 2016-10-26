all: setup build

setup:
	Rscript -e 'install.packages(c("devtools","roxygen2","testthat","covr"),repo="http://cloud.r-project.org/")'

build:
	R CMD build .

install:
	Rscript -e 'devtools::install()'

run:
	echo 'library(stencila); host$$startup()' | R --interactive

check:
	R CMD check $$(ls stencila_*.tar.gz | tail -n 1)

check-as-cran:
	R CMD check $$(ls stencila_*.tar.gz | tail -n 1) --as-cran

test:
	Rscript -e 'devtools::test()'

cover:
	Rscript -e 'covr::package_coverage(".")'

clean:
	rm -rf ..Rcheck
