for STACK in $(pulumi stack ls --json | jq '.[].name') ; do
    pulumi stack select $STACK
    pulumi stack rm --force --yes
done

for STACK in $(pulumi stack ls | grep -v NAME | awk '{print $1}') ; do
    pulumi stack select $STACK
    pulumi stack rm --force --yes
done



