# https://hub.docker.com/_/microsoft-dotnet
FROM mcr.microsoft.com/dotnet/sdk:9.0 AS build
WORKDIR /source

# copy csproj and restore as distinct layers
COPY *.sln .
COPY gnucash-version-control-web/*.csproj ./gnucash-version-control-web/
RUN dotnet restore

# copy everything else and build app
COPY gnucash-version-control-web/. ./gnucash-version-control-web/
WORKDIR /source/gnucash-version-control-web
RUN dotnet publish -c release -o /app --no-restore

# final stage/image
FROM mcr.microsoft.com/dotnet/aspnet:9.0
WORKDIR /app
COPY --from=build /app ./
ENTRYPOINT ["dotnet", "gnucash-version-control-web.dll"]