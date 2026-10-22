# AWS Serverless IoT Pipeline

Pipeline serverless ad alta affidabilità per l'ingestione e la persistenza di dati IoT su **AWS**, completamente gestita tramite Infrastructure as Code (IaC) con **Terraform** e automatizzata via **GitHub Actions** (CI/CD).

---

## 📐 Architettura del Sistema

Il diagramma seguente illustra il flusso dei dati dall'ingestione alla persistenza:

~~~mermaid
graph TD
    Client[📱 IoT Client / Device] -->|HTTP POST Data| API[🌐 API Gateway]
    API -->|Triggers| Lambda[⚡ AWS Lambda Function]
    Lambda -->|Writes Data| DynamoDB[(🗄️ Amazon DynamoDB)]

    subgraph AWS_Cloud[AWS Cloud]
        API
        Lambda
        DynamoDB
    end

    subgraph CICD[CI/CD Pipeline]
        GHA[🤖 GitHub Actions]
    end

    GHA -->|Terraform Apply| AWS_Cloud
~~~

---

## 🛠️ Tecnologie Utilizzate

- **Infrastructure as Code (IaC):** Terraform
- **CI/CD Automation:** GitHub Actions
- **Cloud Provider:** Amazon Web Services (AWS)
  - **API Gateway:** Endpoint REST/HTTP per la gestione delle richieste in ingresso
  - **AWS Lambda:** Compute serverless per la validazione ed elaborazione del payload
  - **Amazon DynamoDB:** Database NoSQL scalabile per lo storage a bassa latenza
- **Runtime Lambda:** Node.js / Python

---

## 🚀 CI/CD & Deploy Automatico

Il repository è configurato con una pipeline automatizzata che esegue i seguenti passaggi a ogni `push` sul branch `main`:

1. **Checkout del codice:** Recupero dei file dal repository.
2. **Setup Terraform:** Inizializzazione dell'ambiente e dei moduli.
3. **Validation:** Verifica formale e sintattica della configurazione HCL.
4. **Terraform Apply:** Deployment o aggiornamento automatico delle risorse sul cloud AWS.

---

## 📁 Struttura del Repository

~~~text
.
├── .github/workflows/    # Pipeline di automazione GitHub Actions
├── modules/             # Moduli Terraform riutilizzabili (API, Lambda, DB)
├── main.tf              # Entry point e orchestrazione dei moduli
├── provider.tf          # Configurazione del provider AWS e backend
├── outputs.tf           # Output delle risorse (URL API Gateway, ARN, ecc.)
└── README.md            # Documentazione del progetto
~~~
