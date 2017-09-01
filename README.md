# Personal-Website-on-AWS

The first step that i had done was to design a basic architecture that is highly available. I had limited the scope of the architecture to the free tier. The architecture that i have designed is given below.  
  
![my website architecture](https://user-images.githubusercontent.com/31011479/29950962-4a2de93a-8e74-11e7-82dd-ad43cc1a98d5.jpg)

### Step-By-Step procedure

1. The first thing that i had done was to get a domain from AWS. Since it is a registrar we can get domains directly from AWS.  
Here is my Domain Name: http://pvspraneeth.com

2. The second step is creating a role where my Ec2 Instances will be able to communicate with the S3 buckets. this helps in improving the security of my AWS instances as my secret access key and password are not stored in the Ec2 instance itself.  
_I have named the role as_ ``` ec2-s3-adminAccess ```

3. Next step is to create the requires security groups for the Ec2 instance and the RDS Instance.
_NOTE: The RDS instance security group should accept traffic only from the Ec2 instance security group so that it is not open directly to the outside world._

**Web Security group.**  

Type | protocol | Port Range | Source
------------ | ------------- | ------------- | -------------
HTTP(80) | TCP(6) | 80 | 0.0.0.0/0
SSH(22) | TCP(6) | 22 | My IP

**Rds Security group.**  

Type | protocol | Port Range | Source
------------ | ------------- | ------------- | -------------
MySQL/Aurora(3306) | TCP(6) | 3306 | Web Security group ID

4. Next Setting up and Application Load Balancer. We can use either an Elastic load balancer or Applicaion load balancer. Since Applicaton Load balancer(ALB) is cheaper in price(if it exceeds free tier) i had chosen to go with ALB

Health check is done on the file healthy.html
