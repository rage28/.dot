#!/usr/bin/env zsh

__certify() {
	# clear state
	unset CURL_CA_BUNDLE

	# init
	script=${(%):-%x}
	scriptdir="${script%/*}"
	certs="${HOME}/.certs.pem"

	certs_ca_src="${scriptdir}/certificates-ca.pem"
	certs_ca_dst="${HOME}/.certificates-ca.pem"

	certs_user_src="${scriptdir}/certificates-user.pem"
	certs_user_dst="${HOME}/.certificates-user.pem"

	# purge existing certs, if any
	silrem "${certs}"
	silrem "${certs_ca_src}"
	silrem "${certs_ca_dst}"
	silrem "${certs_user_dst}"

	# download updated cacerts & create user provided
	downf "http://curl.haxx.se/ca/cacert.pem" "${certs_ca_src}"
	touchf "${certs_user_src}"
	touchf "${certs}"

	# create new certs
	link "${certs_ca_src}" "${certs_ca_dst}"
	link "${certs_user_src}" "${certs_user_dst}"

	fappend "${certs_ca_dst}" "${certs}"
	fappend "${certs_user_dst}" "${certs}"

	# export to cURL
	[ -s $certs ] && export CURL_CA_BUNDLE="${certs}"
}
alias certify='__certify'


# reload with init
__reload_init_dotfiles() {
  certify
  # shellcheck disable=SC1090 disable=2039
  source "$HOME/.zshrc"
}
alias reloadd!='__reload_init_dotfiles'