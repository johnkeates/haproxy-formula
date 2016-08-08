{% if salt['pillar.get']('haproxy:jessie_backported') %}
include:
  - backports
{% endif %}


haproxy.install:
  pkg.installed:
    - name: haproxy
{% if salt['pillar.get']('haproxy:jessie_backported') %}
    - fromrepo: "jessie-backports"
{% endif %}

 {% if salt['pillar.get']('haproxy:require') %}
    - require:
{% for item in salt['pillar.get']('haproxy:require') %}
      - {{ item }}
{% endfor %}
{% endif %}
