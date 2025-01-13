# Game-Notification-System

**Project Overview**

This project is an alert system that sends real-time NBA game day score notifications to subscribed users via SMS/Email. It leverages Amazon SNS, AWS Lambda and Python, Amazon EvenBridge and NBA APIs to provide sports fans with up-to-date game information. The project demonstrates cloud computing principles and efficient notification mechanisms. In this Project i used Terraform as infrastructure as code tool for automating the deployment of the AWS services.

**Features**

- Fetches live NBA game scores using an external API.
- Sends formatted score updates to subscribers via SMS/Email using Amazon SNS.
- Scheduled automation for regular updates using Amazon EventBridge.
- Designed with security in mind, following the principle of least privilege for IAM roles.

**Prerequisites**

- Free account with subscription and API Key at sportsdata.io
- Personal AWS account with basic understanding of AWS and Python
- Terraform and AWS CLI installed on your local machine

**Technical Architecture**

<img width="864" alt="day2_Architecture" src="https://github.com/user-attachments/assets/0e76a07c-d8bc-49e4-be43-6b12b9c3eb41" />

**Technologies**

- Iac: Terraform
- Cloud Provider: AWS
- Core Services: SNS, Lambda, EventBridge
- External API: NBA Game API (SportsData.io)
- Programming Language: Python 3.x
- IAM Security:
- Least privilege policies for Lambda, SNS, and EventBridge.

**Setup Instructions**

**Clone the Repository**

git clone https://github.com/OjoOluwagbenga700/Game-Notification-System.git

cd game-notification-system


**Running Terraform Commands**

**Terraform init**: Initialize Terraform in the project directory to download necessary plugins and modules.

**Terraform Plan**: Generate an execution plan to preview the changes that Terraform will make to the infrastructure

Run **terraform apply --auto-approve **to deploy the infrastructure on AWS.

**What We Learned**

- Designing a notification system with AWS SNS and Lambda.
- Securing AWS services with least privilege IAM policies.
- Automating workflows using EventBridge.
- Integrating external APIs into cloud-based workflows.
- Automating infrastructure deployment using Terraform


**Future Enhancements**

- Add NFL score alerts for extended functionality.
- Store user preferences (teams, game types) in DynamoDB for personalized alerts.
- Implement a web UI
