## DevOps: Mise en place de cloud-native storage 

Pablo Mercado

---

### Sommaire 
<!-- .slide: style="text-align: left;" -->
1. Introduction
1. Longhorn
1. FIO
1. Deployment
1. Benchmark results
1. Conclusion

---

## Longhorn
![](img/longhorn-dashboard-volume-creation.png)

---

## FIO
<!-- .slide: style="text-align: left; font-size: 0.6em;" -->
The author is Jens Axboe.
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.

---

## Deployment - manifest
```bash
kubectl apply -f ex.yaml
```
---

## Deployment - FIO job

```toml
[[idk]]
option=1

```
---

## Benchmark results
![](figures/read_iops.svg)

---

## Conclusion
TODO

---

## Questions ?
<!-- .slide: data-background="#d5c5e8" data-transition="page" -->

