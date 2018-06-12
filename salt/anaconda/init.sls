/opt/Anaconda3-4.4.0-Linux-x86_64.sh:
  cmd.run:
    - name: >
        wget --continue
        https://repo.continuum.io/archive/Anaconda3-4.4.0-Linux-x86_64.sh
        -O /opt/Anaconda3-4.4.0-Linux-x86_64.sh
    - creates: /opt/conda

/opt/conda:
  cmd.script:
    - name: /opt/Anaconda3-4.4.0-Linux-x86_64.sh
    - args: -b -p /opt/conda
    - creates: /opt/conda
