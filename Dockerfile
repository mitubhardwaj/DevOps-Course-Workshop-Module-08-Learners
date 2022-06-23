FROM mcr.microsoft.com/dotnet/sdk:6.0 as base
RUN apt-get -y update
RUN curl -fsSL https://deb.nodesource.com/setup_16.x | bash -
RUN apt-get install -y nodejs
COPY . /src
WORKDIR /src
RUN dotnet build
WORKDIR /src/DotnetTemplate.Web
RUN npm install
RUN npm run build
ENTRYPOINT ["dotnet","run"]



