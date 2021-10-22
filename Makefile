# Also needs to be updated in galaxy.yml
VERSION = 0.1.0

clean:
	rm -f dlwhitehurst-beast-${VERSION}.tar.gz

build: clean
	ansible-galaxy collection build

install: build
	ansible-galaxy collection install --force-with-deps dlwhitehurst-beast-${VERSION}.tar.gz

test:
	cd ~/.ansible/collections/ansible_collections/dlwhitehurst/beast; ansible-test integration -v --color --continue-on-error --diff
