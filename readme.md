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

#### Linux (Ubuntu/Debian)
```bash
# Update package index
sudo apt-get update

# Install prerequisites
sudo apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg \
    lsb-release

# Add Docker's official GPG key
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

# Add Docker repository
echo \
  "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Install Docker Engine
sudo apt-get update
sudo apt-get install -y docker-ce docker-ce-cli containerd.io

# Start Docker service
sudo systemctl start docker
sudo systemctl enable docker

# Add your user to docker group (optional, for non-sudo usage)
sudo usermod -aG docker $USER
# Log out and back in for group changes to take effect
```

### 2. Verify Docker Installation
```bash
docker --version
docker-compose --version
```

### 3. Clone the Repository
```bash
git clone <your-repo-url>
cd wordpress-ppp
```

### 4. Configure Environment (Optional)
Edit `docker-compose.yml` to customize:
- Database passwords
- Port mapping (default: 8100)
- Volume mounts

### 5. Start the Application
```bash
# Build and start containers
docker-compose up -d

# Check status
docker-compose ps

# View logs
docker-compose logs -f
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

## 🎭 Headless WordPress Features

This setup is configured as a **headless WordPress** installation:

- **No Frontend Themes**: All default themes are removed
- **API-First**: Optimized for REST API and headless CMS usage
- **Admin Only**: Accessible only through `/wp-admin` and `/wp-json` endpoints
- **Security Enhanced**: File editing and modifications are disabled
- **Performance Optimized**: Reduced overhead from frontend features

## 📱 PostPlanPro Features

Once activated, you'll have access to:
- **Releases**: Content management and scheduling
- **Schedules**: Automated posting schedules
- **Calendar**: Visual content calendar
- **Auto Generator**: Automated content creation
- **Settings**: Plugin configuration

## 🐳 Docker Commands Reference

### Basic Operations
```bash
# Start services
docker-compose up -d

# Stop services
docker-compose down

# Restart services
docker-compose restart

# View logs
docker-compose logs -f wordpress
docker-compose logs -f db

# Check status
docker-compose ps
```

### Maintenance
```bash
# Update containers
docker-compose pull
docker-compose up -d

# Rebuild custom image
docker-compose down
docker build -t wordpress-postplanpro:latest .
docker-compose up -d

# Clean up unused resources
docker system prune -a
```

### Database Operations
```bash
# Access MySQL shell
docker-compose exec db mysql -u root -p

# Backup database
docker-compose exec db mysqldump -u root -p wordpress > backup.sql

# Restore database
docker-compose exec -T db mysql -u root -p wordpress < backup.sql
```

## 🔧 Troubleshooting

### Common Issues

#### Port Already in Use
```bash
# Change port in docker-compose.yml
ports:
  - "8101:80"  # Use different port
```

#### Permission Issues
```bash
# Fix file permissions
sudo chown -R $USER:$USER .
```

#### Container Won't Start
```bash
# Check logs
docker-compose logs wordpress

# Rebuild image
docker-compose down
docker build -t wordpress-postplanpro:latest .
docker-compose up -d
```

#### Database Connection Issues
```bash
# Wait for database to be ready
docker-compose logs db

# Restart services
docker-compose restart
```

### Reset Everything
```bash
# Stop and remove everything
docker-compose down -v

# Remove custom image
docker rmi wordpress-postplanpro:latest

# Start fresh
docker-compose up -d
```

## 📚 Additional Resources

- [WordPress Documentation](https://wordpress.org/support/)
- [PostPlanPro GitHub](https://github.com/IORoot/postplanpro)
- [Docker Documentation](https://docs.docker.com/)
- [Docker Compose Reference](https://docs.docker.com/compose/)

## 🤝 Support

If you encounter issues:
1. Check the troubleshooting section above
2. Review Docker and WordPress logs
3. Ensure all prerequisites are met
4. Verify Docker is running and accessible

## 📝 License

This project is licensed under the same terms as the PostPlanPro plugin.

---

**Happy Content Scheduling! 🎉**

