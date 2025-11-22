# DAG (Directed Acyclic Graph) of dependencies for Infrastructure
```mermaid
block
columns 5
id23["Ready"]:4 id19["Ready"]
space:5
id18["Microservices"] space:4 
space:5
space:3 id17["KUBEVAULT"] space
space:5
id16["Services"] space:4
space:5 
id15["Configure"] id14["Configure"] id13["Configure"] space:2
space:5 
space id12["Assemble"] id11["Assemble"] space:2
space:5 
id10["Install"] id9["Install"] id8["Install"] id7["Install"] id6["Install"]
space:5 
id5["Provision"] id4["Provision"] id3["Provision"] id2["Provision"] id1["Provision"]
Main Node1 Node2 Vault Seer
space:5
Bootstrap:5

id1-->id6
id2-->id7
id3-->id8
id4-->id9
id5-->id10
id10-->id12
id9-->id12
id8-->id11
id12-->id11
id11-->id13
id11-->id14
id11-->id15
id13-->id16
id14-->id16
id15-->id16
id7-->id17
id16-->id17
id17-->id18
id18-->id23
id6-->id19

 ```