FROM wordpress:latest

# Install git and other dependencies needed for plugin installation
RUN apt-get update && apt-get install -y \
    git \
    unzip \
    && rm -rf /var/lib/apt/lists/*

# Clone the PostPlanPro plugin from GitHub master branch
RUN git clone https://github.com/IORoot/postplanpro.git /tmp/postplanpro

# Copy the plugin to the WordPress plugins directory
RUN cp -r /tmp/postplanpro /usr/src/wordpress/wp-content/plugins/wp-plugin__postplanpro

# Set proper permissions
RUN chown -R www-data:www-data /usr/src/wordpress/wp-content/plugins/wp-plugin__postplanpro

# Remove default WordPress plugins (Akismet and Hello Dolly)
RUN rm -rf /usr/src/wordpress/wp-content/plugins/akismet
RUN rm -rf /usr/src/wordpress/wp-content/plugins/hello.php

# Remove default themes to make WordPress headless
RUN rm -rf /usr/src/wordpress/wp-content/themes/*

# Create a minimal index.php to prevent direct access
RUN echo '<?php http_response_code(404); ?>' > /usr/src/wordpress/index.php

# Add headless WordPress configuration
RUN echo '<?php' > /usr/src/wordpress/wp-config-headless.php && \
    echo '// Headless WordPress Configuration' >> /usr/src/wordpress/wp-config-headless.php && \
    echo 'define("HEADLESS_MODE", true);' >> /usr/src/wordpress/wp-config-headless.php && \
    echo 'define("DISALLOW_FILE_EDIT", true);' >> /usr/src/wordpress/wp-config-headless.php && \
    echo 'define("DISALLOW_FILE_MODS", true);' >> /usr/src/wordpress/wp-config-headless.php && \
    echo 'define("WP_AUTO_UPDATE_CORE", false);' >> /usr/src/wordpress/wp-config-headless.php && \
    echo '// Disable frontend features' >> /usr/src/wordpress/wp-config-headless.php && \
    echo 'define("WP_POST_REVISIONS", false);' >> /usr/src/wordpress/wp-config-headless.php

# Clean up temporary files
RUN rm -rf /tmp/postplanpro

# Expose port 80
EXPOSE 80

# Use the default WordPress entrypoint
CMD ["apache2-foreground"]
