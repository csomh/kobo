all: help


help:
	@echo "Usage: make <target>"
	@echo
	@echo "Available targets are:"
	@echo " help                    show this text"
	@echo " clean                   remove python bytecode and temp files"
	@echo " install                 install program on current system"
	@echo " log                     prepare changelog for spec file"
	@echo " source                  create source tarball"


clean:
	@python setup.py clean
	find . -\( -name "*.pyc" -o -name '*.pyo' -o -name "*~" -\) -delete


install:
	@python setup.py install


log:
	@(date +"* %a %b %e %Y AUTHOR <EMAIL> - VERSION"; git log --pretty="format:- %s (%an)" | cat) | less


source: clean
	@python setup.py sdist