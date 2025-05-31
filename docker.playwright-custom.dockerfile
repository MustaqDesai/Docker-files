FROM mcr.microsoft.com/playwright:v1.52.0-noble
COPY ./Playwright /playwright-home/
WORKDIR /playwright-home
# Install dependancies
RUN npm install
# Install browsers
RUN npx playwright install-deps
# Run playwright tests
CMD ["npx", "playwright", "test", "--reporter=list"]
