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
### **4️⃣ Crete GCS bucket to store Terraform State in GCS**

Run:
```sh
gsutil mb -p your-gcp-project-id -l us-central1 gs://your-terraform-state-bucket
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

### **6️⃣ Monitor in GCP Console**

1. Go to **Compute Engine > VM Instances** in GCP Console.  
2. Check if the `demo-instance` is running.  

### **7️⃣ Destroy Resources**  

Run the following command to destroy resources:  

```sh
terraform destroy -auto-approve
```

### **8️⃣ Verify Destruction**  

To verify that the resources have been successfully destroyed, run:

```sh
terraform show
