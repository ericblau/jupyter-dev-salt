include:
  - jupyterhub/users
  - anaconda
  - singularityspawner
  - jupyterhub/config

{%- do salt.log.error('%s testing jinja logging' % salt['pillar.get']("hostdata:minion2:anaconda" ) ) -%}

{%if true %}

{%set aversion = salt['pillar.get']("hostdata:%s:anaconda" % grains['host'],{} ) %}
{%set install_dir = salt['pillar.get']("anaconda:%s:install_dir" % aversion ,{} ) %}

{% for  attr in salt['pillar.get']("jupyter_modules",[]) %}
anaconda-{{attr['name']}}:
  cmd.run: 
{% if attr['method'] == 'pip' %}

    - name: {{install_dir}}/bin/pip  install {{attr['name']}}
{% else %}
    {% if attr['repo'] is defined %}
    - name: {{install_dir}}/bin/conda install -y -q -c {{attr['repo']}} {{attr['name']}}
    {% else %}
    - name: {{install_dir}}/bin/conda install -y -q {{attr['name']}}
    {% endif %}
{% endif %}
    - user: root
    - group: root 
    - shell: /bin/bash

{% endfor %}

{%set host = grains['host'] %}
{%set jupyter_key =  salt['pillar.get']("hostdata:%s:jupyter:jupyter_ssl_key" % grains['host'],{} ) %}


{%endif%}
