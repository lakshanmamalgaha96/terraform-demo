# Terraform GCP Deployment  

This project automates the deployment of a **Google Cloud Compute Engine VM** using **Terraform**. The Terraform state is stored in a **Google Cloud Storage (GCS) bucket**, and environment variables are loaded from a `.env` file.

---

## **📌 Prerequisites**  
- **Google Cloud SDK** installed → [Install Guide](https://cloud.google.com/sdk/docs/install)  
- **Terraform** installed → [Install Guide](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli)  
- A **GCS bucket** created for Terraform state storage  
- A **Google Cloud project ID**  
- **Service account** with required IAM roles:
  - `roles/storage.objectViewer` (for accessing state in GCS)
  - `roles/compute.admin` (for creating Compute Engine resources)

---

## **🛠️ Setup Instructions**  

### **1️⃣ Clone the Repository**
```sh
git clone https://github.com/lakshanmamalgaha96/terraform-demo.git
cd terraform-demo
```
### **2️⃣ Configure Environment Variables**

```sh
echo "PROJECT_ID=your-gcp-project-id" > .env
```
Replace ```your-gcp-project-id``` with your actual Google Cloud Project ID.

### **3️⃣ Authenticate with Google Cloud**

Run:

```sh
gcloud auth application-default login
gcloud config set project your-gcp-project-id
```
### **4️⃣ Grant Required IAM Permissions**

Run:
```sh
gcloud projects add-iam-policy-binding your-gcp-project-id \
  --member="user:$(gcloud config get-value account)" \
  --role="roles/storage.objectViewer"

gcloud projects add-iam-policy-binding your-gcp-project-id \
  --member="user:$(gcloud config get-value account)" \
  --role="roles/compute.admin"
```

### **5️⃣ Initialize and Deploy with Terraform**

Run:
```sh
./run-terraform.sh
```

This script will:

- Load environment variables
- Initialize Terraform (`terraform init`)
- Apply the Terraform configuration (`terraform apply`)
