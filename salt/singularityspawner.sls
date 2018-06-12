singularityspawner:
  pkg.installed: 
    - name: git # make sure git is installed first!
  git.latest:
    - name: https://github.com/ericblau/jupyterhub-singularity-spawner.git
    - target: /opt/local/singularity-spawner
