# this will enable backports for either jessie or wheezy, but additional options exist, see https://haproxy.debian.net

# deb http://httpredir.debian.org/debian wheezy-backports-sloppy main
{% set specific_backport_repo = "bla" %}
{% if grains['oscodename'] == 'wheezy' %}
{% set specific_backport_repo = "wheezy-backports-sloppy" %}
{% elif grains['oscodename'] == 'jessie' %}
{% set specific_backport_repo = "jessie-backports" %}
 {% endif %}

enable-debian-backports:
  pkgrepo.managed:
    - humanname: {{ specific_backport_repo }}
    - name: deb http://httpredir.debian.org/debian {{ specific_backport_repo }} main contrib non-free
    - file: /etc/apt/sources.list.d/{{ specific_backport_repo }}.list
