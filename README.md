## In progress

# Purpose
- Demonstrate tech stack (Ruby, rails, postgres, grafana, vault, ect...)
- Possibly help others with healthcare costs!

# Goals
- Create an open source web-app/site that can unify health care data
- Create open source A.I web scrapper for health care information
- Use NLP to process volume of data
- Remain open source and only use free API's
- Combine site idea's like reddit, health care cost lookup, and more into single entity
- Congregate health care data and represent it in a modern, digestible format that users can approach as *the* site, much like reddit is for *information*, but for health care.
  
# What makes this different?
- Comparing other sites that do this, see https://www.fairhealthconsumer.org/ , https://www.medicare.gov/procedure-price-lookup/ , [find original site that inspired this], the idea is to congregate health care data.

# Design Dilemma
- Becoming a "one stop shop" for health care costs comes at a cost of doing business. The goal here is free, without tapping into large scale infrastructure that has accumulated this data (google and other web scrappers) there likely isn't an end result that is professional without a large amount of work with gathering data on my own. This is already a problem
- Relies on user data to be interesting (user engagement is one of selling points)

# Key Considerations
- At this point you may be thinking my insurance site does this for me when I figure out care to go to.
- Well my ask of you is what if we could tap into each of these insurance sites, think of this as a very grandiose idea to get an idea of what ALL insurances cost for a facility. Where users can discuss and contribute to alleviate general confusion over health care services and costs. 
- Expose insurance costs to all!
- Having been on multiple insurances throughout my career the one thing I think it lacks is open communication with the user base and it feels intentional to keep people siphoned into the confusing world of insurance.
- Imagine a site where you can search for your health care facility, you can view google reviews, start a thread about services, contribute to others threads, add your own services, potential charge code costs you got. 

---------------------------
# Developing Below:


## Commands:

docker build -t ruby:3.3.0 -f docker/ruby-3-3-bookwork.Dockerfile  .
docker build -t ruby-rails:3.3.0 -f docker/ruby-rails.Dockerfile .

docker run -it --rm --name ruby_3_3 ruby:3.3.0 sh
docker run -it --rm --name ruby_app ruby-rails:3.3.0 sh

kubectl get endpoints,svc,ingress -n hf-review
kubectl exec -it deploy/ruby-app -n hf-review -- /bin/sh

#patch load balancer
kubectl patch service nginx-ingress-ingress-nginx-controller -n hf-review -p '{"spec": {"type": "LoadBalancer", "externalIPs":["192.168.10.91"]}}'C


Site like reddit or threads that can 
- create users
- user profiles
- add comments to facilities
- add costs to facilities 
- easy to access
- on backend use AI to scrape the web and discover health facilities
- use NLM ?
- web scrapping / 
- grafana dashboard?



Services Install

helm repo add bitnami https://charts.bitnami.com/bitnami
helm repo update

# Postgres
helm install redis bitnami/redis --namespace hf-review
helm install my-postgresql bitnami/postgresql --namespace hf-review

#Grafana
helm install grafana grafana/grafana --namespace hf-review

# Vault
helm repo add hashicorp https://helm.releases.hashicorp.com
helm install vault hashicorp/vault



STUCK PVS?
kubectl patch pv grafana-pv-volume -p '{"metadata":{"finalizers":null}}'


rails generate migration CreateFacilities \
  name:string \
  address:string \
  phone:string \
  reviews:text \
  images:string:array \
  services:string:array \
  doctors:string:array \
  operating_hours:string \
  insurance_accepted:text \
  patient_capacity:integer \
  medical_equipment:text \
  specialized_departments:text \
  accreditations:text \
  patient_amenities:text \
  health_records:boolean \
  emergency_protocols:text

rails generate migration CreateFacilities name:string address:string phone:string reviews:text images:string:array services:string:array doctors:string:array operating_hours:string insurance_accepted:text patient_capacity:integer medical_equipment:text specialized_departments:text accreditations:text patient_amenities:text health_records:boolean