# DevOps: Mise en place de cloud-native storage 
**Etudiant**: Pablo Mercado

__Abstract__

Alors que plusieurs secteurs de l’industrie et organisations gouvernementales se tournent vers
le développement d’applications cloud-native, il reste que les orchestrateurs de containers (tel
que Kubernetes) ne fournissent pas de stockage persistant par défaut.
Dans ce travail de Bachelor, les performances de Longhorn, une solution de stockage open
source cloud-native orientée bloc sont testées sur le cluster de l’IICT avec l’outil FIO (Flexible
I/O Tester). Une analyse théorique compare Longhorn et les différentes solutions existantes
que pourrait héberger un fournisseur de cloud public. L’analyse et les résultats expérimentaux
indiquent que Longhorn peut mieux performer qu’un cluster EKS sur certaines métriques
tel que l’écriture aléatoire et séquentielle. Longhorn offre aussi une durabilité configurable et
surtout moins mystérieuse qu’une solution propriétaire comme un volume EBS.
---

## Jobs Fio
Le *jupyter notebook* `fio-benchmark.ipynb` contient:
* l'ensemble des graphiques liés au travail de bachelor
* les instructions minimales pour la réalisation des benchmarks sur les différents clusters testés

Les résultats des benchmarks sont disponibles dans le dossier `fio-jobs-output`.

## Image de test
Les jobs Fio sont packagés dans une image docker se trouvant dans le dossier `docker/iict`:

```bash
docker pull ghcr.io/pabloheigvd/tb-fiobench:latest
```
## Deployments testés
Les *deployments* utilisés se trouvent dans le dossier `deployments`. Les plugins de stockage Longhorn et EBS ont été testés.