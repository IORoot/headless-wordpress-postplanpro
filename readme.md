![header](header.jpeg)

# WordPress PostPlanPro Docker Setup (Headless)

A headless WordPress environment with the PostPlanPro plugin pre-installed, optimized for API-driven content scheduling and social media management. No frontend themes or public-facing content - purely backend functionality.

## 🚀 Quick Start

```bash
git clone <your-repo-url>
cd wordpress-ppp
docker-compose up -d
```

Access the admin panel at `http://localhost:8100/wp-admin` to manage your content!

## 📋 Prerequisites

- **macOS**: [OrbStack](https://orbstack.dev/) (recommended) or [Docker Desktop](https://www.docker.com/products/docker-desktop/)
- **Windows**: [Docker Desktop](https://www.docker.com/products/docker-desktop/)
- **Linux**: [Docker Engine](https://docs.docker.com/engine/install/)

## 🛠️ Installation Steps

### 1. Install Docker (Choose your platform)

#### macOS - OrbStack (Recommended)
```bash
# Install via Homebrew
brew install orbstack

# Or download from https://orbstack.dev/
# Start OrbStack from Applications folder
```

#### macOS - Docker Desktop
```bash
# Download from https://www.docker.com/products/docker-desktop/
# Install and start Docker Desktop
```

#### Windows
```bash
# Download from https://www.docker.com/products/docker-desktop/
# Install and start Docker Desktop
```

### 2. Clone the Repository
```bash
git clone <your-repo-url>
cd wordpress-ppp
```

### 3. Start the Application
```bash
# Build and start containers
docker-compose up -d
```

## 🌐 Access WordPress

- **Admin Panel**: http://localhost:8100/wp-admin
- **API Endpoints**: http://localhost:8100/wp-json/wp/v2/
- **Database Host**: `db` (internal Docker network)
- **Database Name**: `wordpress`
- **Database User**: `wordpress`
- **Database Password**: `your_mysql_password` (from docker-compose.yml)

**Note**: This is a headless WordPress setup. The frontend (http://localhost:8100) will return a 404 error as it's designed for API-only access.

## 🎯 WordPress Setup

### First-Time Setup
1. **Choose Language**: Select your preferred language
2. **Site Information**:
   - Site Title: Your site name
   - Username: Choose an admin username
   - Password: Create a strong password
   - Email: Your email address
3. **Install WordPress**: Click "Install WordPress"

### Access Admin Panel
- **URL**: http://localhost:8100/wp-admin
- **Username**: The username you created
- **Password**: The password you set

## 🔌 Activate PostPlanPro Plugin

1. **Navigate to Plugins**: WordPress Admin → Plugins → Installed Plugins
2. **Find PostPlanPro**: Look for "PostPlanPro" in the list
3. **Activate Plugin**: Click "Activate" button
4. **Verify Installation**: Check that PostPlanPro appears in the admin menu
