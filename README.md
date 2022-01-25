# Chat-App-using-Socket.io
A simple chat app using socket.io
  
See it in action - [Kunal Chat App](https://kunal-chat-app.herokuapp.com)

first, we need to create our Vpc
Wich, we need to set the provider which going to be aws and then the region we will be working on then using the resource we call the type of module.
Then we pass to create the subnets using  vpc_id   and availability_zone we can stable our subnets.
Now is time to create EC2 instances in public subnets as same before we use the resource to call type model we set the type instance which is going to be aws then we set ami which is the image of OS version, also the type of machine we going to be using setting t2.micro as an example then we need to set the subnet  we already create before the finals steps are set key name and the provider region 
*Application Load Balancer
we need to create 5 files, the main setup alb we create the configuration of the security group, the security rules , and we assign the subnet id.
Alb-Certificate we validate the DNS method, set a route simple as that.
alb-DNS we set the name and the DNS settings.
alb-listener we set the port and what type of protocol we going to be using on this case would be TCP and port *80*
At the end of the file alb-listener-rules, we set the name of the target group with the vpc_id, port, and type of protocol.
