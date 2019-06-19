## Ejecutar cluster de Hadoop dentro de containers Docker


### Cluster de 3 nodos

##### 1. descargar imagen Docker

```
sudo docker pull juliop1980/hadoop-cluster
```

##### 2. clonar repositorio de github

```
git clone https://github.com/juliop1980/hadoop-cluster
```

##### 3. crear red de hadoop

```
sudo docker network create --driver=bridge hadoop
```

##### 4. ejecutar container

```
cd hadoop-cluster
chmod +x start-container.sh
sudo ./start-container.sh
```

**output:**

```
start hadoop-master container...
start hadoop-slave1 container...
start hadoop-slave2 container...
root@hadoop-master:~# 
```
- ejecutar 3 containers con 1 master y 2 esclavos
- entraras en el directorio /root del container hadoop-master

##### 5. ejecutar hadoop

```
./start-hadoop.sh
```

##### 6. run wordcount

```
./run-wordcount.sh
```

**output**

```
input file1.txt:
Hola Hadoop

input file2.txt:
Hola Docker

wordcount output:
Docker    1
Hadoop    1
Hola    2
```

### Cluster de hadoop de tamaño arbitrario

##### 1. descargar imagenes de docker y clonar repositorio de github

hacer 1~3 como sección A

##### 2. transformar imagen docker

```
sudo ./resize-cluster.sh 5
```
- especificar parametro > 1: 2, 3..
- este script solamente transforma la imagen de hadoop con un diferente archivo **slaves**, que especifica el nombre de los nodos esclavos


##### 3. ejecutar container container

```
sudo ./start-container.sh 5
```
- usar el mismo parametro del paso 2

##### 4. ejecutar cluster de hadoop

hacer 5~6 como seccion A