setup: install_ansible

install_ansible:
	./bin/install-ansible.sh

install_common:
	ansible-playbook -i localhost -c local install-common.yml --ask-become-pass