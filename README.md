# Onion
Onion is a web service that is accessible via the Tor network. Tor provides anonymity by routing users' web traffic through a free, worldwide, volunteer overlay network consisting of more than seven thousand relays. This service allows you to set up a static web page accessible through a unique .onion URL, ensuring privacy and anonymity.

----

## Requirements

- [Docker](https://docs.docker.com/engine/install/)

- [Tor Browser](https://tb-manual.torproject.org/installation/)

- Tor :
``sudo apt install tor``

----

## Usage

**To run this project:**

1. **SSH key**
Due to SSH fortification, you must have an SSH key present on your system, in the standard folder, with the base name (~/.ssh/id_rsa.pub).
If you need to create one:

``ssh-keygen -t rsa -b 4096``


2. **Then you have to fill the .env file in srcs folder and modify sshd_config accordly** :

**.env**
````
USERNAME=[your_username]
PASSWORD=[your_password]
````

**sshd_config**
````
AllowUsers [your_username]
````


3. **Start the services:**

``make``

- You can check the Status, to ensure everything is running smoothly:

``make status``

- View logs :

``make logs``

- To see all the commands avaible :

``make help``

4. **SSH Connection**

- **Get the Onion Address:**

``make show-onion``


- **Establish an SSH Connection:**

``torify ssh -i ~/.ssh/id_rsa -p 4242 -o IdentitiesOnly=yes [username]@[your_onion_address].onion``

Replace **[username]** with the username you've set up and **[your_onion_address]** with the address displayed in the previous step.

1. **Accessing the Web Page**

- Open Tor browser and go to :

``http://[your_onion_address].onion``

----

## Understanding the Tor Network
The Tor (The Onion Router) network is designed to provide users with anonymity when browsing the internet. By routing traffic through a series of volunteer-operated servers, Tor obscures users' locations and usage from network surveillance or traffic analysis. This process is called "onion routing" as data is encrypted in layers, like the layers of an onion.

**Why Use Tor?**
- Privacy: Websites can't track your personal information or location.
- Freedom: Access sites blocked by censors.
- Research: Conduct sensitive tasks without leaving a trace, ideal for journalists, political activists, and others.

However, while Tor provides anonymity, it doesn't guarantee end-to-end encryption. Always ensure secure connections (HTTPS) when transmitting sensitive data.

