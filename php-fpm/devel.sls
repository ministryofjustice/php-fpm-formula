{% for package in ['patch', 'autoconf', 'automake', 'libtool', 'bison', 'make', 'libffi-dev', 'libyaml-dev', 'libxslt1-dev', 'libssl-dev', 'g++', 'libevent-dev'] %}
{{package}}:
  pkg:
    - installed
{% endfor %}

