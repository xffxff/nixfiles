import yaml

from os import listdir
from os.path import isfile, join

mypath = "/mnt/c/Users/zhoufan/.config/clash/profiles/"
onlyfiles = [f for f in listdir(mypath) if isfile(join(mypath, f)) and "list" not in f]
current_config_file = sorted(onlyfiles)[-1]


with open(mypath + current_config_file, 'r') as file:
    current_config = yaml.load(file, yaml.Loader)

current_config['rules'].insert(0, 'DOMAIN-SUFFIX,inspir.work,DIRECT')
current_config['rules'].insert(0, 'IP-CIDR,11.1.2.13/20,DIRECT')
# print(current_config['rules'])

with open(mypath + current_config_file, 'w') as file:
    yaml.dump(current_config, file)

