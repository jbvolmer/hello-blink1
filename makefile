all: clean hello-blink1-bash hello-blink1-py

hello-blink1-bash:
	cp hello-blink1.sh hello-blink1-bash
	chmod u+x hello-blink1-bash
test-bash:
	./hello-blink1-bash
hello-blink1-py:
	cp hello-blink1.py hello-blink1-py
	chmod u+x hello-blink1-py
test-py:
	# flash
	./hello-blink1-py -r 255 -g 255 -b 255 -t 10 -f
	# steady
	./hello-blink1-py -r 255 -g 255 -b 255 -t 10
install:
	cp install-blink1-tool.sh install-blink1-tool
	chmod u+x install-blink1-tool	
	./install-blink1-tool
clean:
	rm -rf hello-blink1-bash hello-blink1-py  
	rm -rf blink1-tool install-blink1-tool
