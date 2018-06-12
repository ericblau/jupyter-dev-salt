{% from "jupyterhub/map.jinja" import jupyter_map with context %}

{%if  true %}
{%set host = grains['host'] %}

jupyterhub_config:
  file.managed:
    - name: {{ jupyter_map.jupyter_config }}
    - source: {{ jupyter_map.jupyter_config_src }}
    - template: jinja
    - user: jupyter
    - group: jupyter
    - makedirs: True
    - mode: 0644

jupyterhub_service:
  file.managed:
    - name: {{ jupyter_map.jupyter_service }}
    - source: {{ jupyter_map.jupyter_service_src }}
    - template: jinja
    - user: root
    - group: root
    - makedirs: True
    - mode: 0644
   
jupyterhub_public_key:
  file.managed:
    - name: {{ jupyter_map.jupyter_ssl_cert }}
    - contents_pillar: "hostdata:{{ host }}:jupyter:jupyter_ssl_cert"
    - user: jupyter
    - mode: 600

jupyterhub_private_key:
  file.managed:
    - name: {{ jupyter_map.jupyter_ssl_key }}
    - contents_pillar: "hostdata:{{ host }}:jupyter:jupyter_ssl_key"
    - user: jupyter 
    - mode: 600

jupyterhub_log:
  file.managed:
    - name: {{ jupyter_map.jupyter_log}}
    - user: jupyter 
    - makedirs: True
    - mode: 644

jupyterhub_pid:
  file.managed:
    - name: {{ jupyter_map.jupyter_pid }}
    - user: jupyter 
    - makedirs: True
    - mode: 644

jupyterhub.conf.logrotate:
  file.managed:
    - name: {{ jupyter_map.logrotate_conf}}
    - source: {{ jupyter_map.logrotate_conf_src}}
    - template: jinja
    - user: root
    - group: root
    - mode: 644
{%endif%}
