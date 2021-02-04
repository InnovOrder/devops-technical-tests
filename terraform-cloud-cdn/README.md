# Terraform Cloud CDN

Le but de ce test est de créer un module terraform permettant de créer un CDN sur Google Cloud.

## Liens utiles

Voici quelques liens utiles pour commencer :
- [Documentation Gcloud sur Cloud CDN](https://cloud.google.com/cdn/docs/overview?hl=fr)
- [Documentation terraform](https://www.terraform.io/docs/index.html)
- [Documentation du provider google pour terraform](https://registry.terraform.io/providers/hashicorp/google/latest/docs)
- [Documentation sur les modules terraform](https://www.terraform.io/docs/language/modules/syntax.html)

## Fonctionnalités du module

### Fonctionnalités indispensables

Le module doit avoir les fonctionnalités suivantes :
- un bucket Cloud Storage en mode website qui contiendra les fichiers situé dans [templated-industrious](./templated-industrious) et qui doit rediriger toutes requêtes vers index.html (les fichiers peuvent être uploadés manuellement dans le bucket)
- un Cloud CDN qui a pour backend le bucket
- un HTTP load balancer qui utilisera le bucket comme backend
- un DNS qui pointera en Alias vers ce loadbalancer

### Amélioration du module

- Transformer le load balancer en un HTTPS load balancer avec un certificat SSL managé par GCP

### Points bonus

- Ajouter un HTTP loadbalancer qui servira pour faire de la redirection HTTP vers HTTPS

## Variables du modules

Le module doit prendre en entrée deux variables :
- `dns_name` : qui sera le nom du dns à créer
- `google_dns_managed_zone_name`: qui sera le nom de la zone DNS dans laquelle le DNS devra être créer

## Test du module

Le module doit pouvoir être appelé par le code terraform situé dans ce dossier. En changeant la source du module dans [cdn.tf](./cdn.tf), il doit être possible de créer ce Cloud CDN.

## Besoin pour réaliser ce test

Pour pouvoir réaliser ce test, il est nécessaire d'avoir un compte Gcloud et un projet dessus. Pour tout nouveau compte, 300€ gratuits sont disponibles. Il est donc possible de réaliser le test gratuitement.

Il sera aussi nécessaire d'avoir une zone DNS afin de créer les ressources DNS. Comme le candidat n'aura pas nécessairement un nom de domaine à lui, Innovorder pourra lui en prêter un pour la durée du test.

Pour cela, le candidat devra suivre la procédure suivante :
- Sur GCP, dans Cloud DNS, cliquer sur "Create Zone"
- Dans `Zone name`, renseignez `<prenom-candidat>-<nom-candidat>-lab-innovorder-dev`
- Dans `DNS name`, renseignez `<prenom-candidat>-<nom-candidat>.lab.innovorder.dev`
- Cliquez sur "Create"

La zone devrait être créer. En cliquant dessus, vous devriez voir le `DNS name` renseigné et la donnée suivante :
```
ns-cloud-AA.googledomains.com.
ns-cloud-BB.googledomains.com.
ns-cloud-CC.googledomains.com.
ns-cloud-DD.googledomains.com.
```

Envoyez cette donnée au DevOps Innovorder qui suit votre candidature.
Vous pourrez ensuite utiliser cette zone dns pour créer des DNS et certificats SSL.
