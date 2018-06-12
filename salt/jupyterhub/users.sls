jupyter:
  group:
    - present
  user:
    - present
    - groups:
      - jupyter
    - require:
      - group: jupyter

