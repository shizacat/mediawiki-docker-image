# Add extensions

FROM mediawiki:1.43.1

# Install extensions: SyntaxHighlight_GeSHip. In Box.
# RUN cd /tmp && \
#     curl https://extdist.wmflabs.org/dist/extensions/SyntaxHighlight_GeSHi-REL1_43-fe04b0e.tar.gz --output SyntaxHighlight_GeSHi-REL1_43-fe04b0e.tar.gz && \
#     tar -xzf SyntaxHighlight_GeSHi-REL1_43-fe04b0e.tar.gz -C /var/www/html/extensions && \
#     chown -R www-data:www-data /var/www/html/extensions/SyntaxHighlight_GeSHi && \

# Neded for PdfHandling extension
RUN apt-get update && \
    apt-get install -y ghostscript imagemagick poppler-utils && \
    rm -rf /var/lib/apt/lists/*

# Install extensions: Admin_Links
# https://www.mediawiki.org/wiki/Extension:Admin_Links
RUN cd /tmp && \
    curl https://extdist.wmflabs.org/dist/extensions/AdminLinks-REL1_43-ea4424d.tar.gz \
        --output AdminLinks-REL1_43-ea4424d.tar.gz && \
    tar -xzf AdminLinks-REL1_43-ea4424d.tar.gz -C /var/www/html/extensions && \
    chown -R www-data:www-data /var/www/html/extensions/AdminLinks && \
    rm AdminLinks-REL1_43-ea4424d.tar.gz
