INSTALL_PATH?=/usr/local/FreeCT/FreeCT_WFBP/
SCRIPT_PATH?=/usr/bin/
SRC_DIR=$(shell pwd)/

all: rebuild

rebuild:
	mkdir -p src/obj
	$(MAKE) -C src ../test
	cp test fct_wfbp

install:
	@echo Source directory is: ${SRC_DIR}.
	@echo By default, the FreeCT_wFBP executable and support files
	@echo are installed in:
	@echo 
	@echo ${INSTALL_PATH}
	@echo
	@echo A script, fct_wfbp, will placed in ${SCRIPT_PATH} that should be used
	@echo that should be used to execute reconstructions.
	@echo
	@echo After installation, type "fct_wfbp --help" for more information.

	mkdir -p ${INSTALL_PATH}
	cp -v -u -r ${SRC_DIR}include ${INSTALL_PATH}
	cp -v -u -r ${SRC_DIR}prms ${INSTALL_PATH}
	cp -v -u -r ${SRC_DIR}resources ${INSTALL_PATH}
	cp -v -u -r ${SRC_DIR}src ${INSTALL_PATH}
	cp -v -u -r ${SRC_DIR}fct_wfbp ${INSTALL_PATH}
	cp -v -u -r ${SRC_DIR}README.md ${INSTALL_PATH}
	cp -v -u -r ${SRC_DIR}makefile ${INSTALL_PATH}
	cp -v -u -r ${SRC_DIR}LICENSE.md ${INSTALL_PATH}

# Create our execution script
	@echo Creating execution script ${SCRIPT_PATH}fct_wfbp...
	touch ${SCRIPT_PATH}fct_wfbp
	chmod +x ${SCRIPT_PATH}fct_wfbp
	@echo "#!/bin/bash" > ${SCRIPT_PATH}fct_wfbp
	@echo ${INSTALL_PATH}fct_wfbp \"\$$\@\" >> ${SCRIPT_PATH}fct_wfbp


.PHONY: all clean

clean:
	$(MAKE) -C src clean
