PKGNAME = `sed -n "s/Package: *\([^ ]*\)/\1/p" DESCRIPTION`
PKGVERS = `sed -n "s/Version: *\([^ ]*\)/\1/p" DESCRIPTION`

all: install_deps 

install_deps:
	Rscript \
	-e 'if (!requireNamespace("remotes")) install.packages("remotes")' \
	-e 'remotes::install_deps(dependencies = TRUE)'

update:
	git fetch origin master:utemp
	git merge utemp
	git push

rd:
	Rscript -e 'rmarkdown::render("README.Rmd")'

check:
	Rscript -e 'rcmdcheck::rcmdcheck()'
