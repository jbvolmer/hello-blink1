#!/bin/bash

function install-blink1-tool() 
{
	git clone https://github.com/todbot/blink1-tool.git
	cd blink1-tool; make; make install;
}

function install-python-lib() 
{
	pip install blink1; pip3 install blink1
}

install-blink1-tool

install-python-lib
