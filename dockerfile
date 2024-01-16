# Database
# FROM mysql:8.0

# # ENV MYSQL_ROOT_PASSWORD=bd1374
# # ENV MYSQL_PASSWORD: bd1374
# # ENV MYSQL_DATABASE: scage

# COPY ./create_tables.sql /docker-entrypoint-initdb.d/

# User scage API
FROM mcr.microsoft.com/dotnet/aspnet:7.0 AS base
WORKDIR /app
EXPOSE 80
EXPOSE 443

FROM mcr.microsoft.com/dotnet/sdk:7.0 AS build
WORKDIR /src
COPY ["scage-users-api/SCAGEUsers/SCAGEUsers.api/SCAGEUsers.api.csproj", "SCAGEUsers/SCAGEUsers.api/"]
COPY ["scage-users-api/SCAGEUsers/SCAGEUsers.Application/SCAGEUsers.Application.csproj", "SCAGEUsers/SCAGEUsers.Application/"]
COPY ["scage-users-api/SCAGEUsers/SCAGEUsers.Infrastructure/SCAGEUsers.Infrastructure.csproj", "SCAGEUsers/SCAGEUsers.Infrastructure/"]
RUN dotnet restore "SCAGEUsers/SCAGEUsers.api/SCAGEUsers.api.csproj"
COPY . .
WORKDIR "/src/scage-users-api/SCAGEUsers/SCAGEUsers.api"
RUN dotnet build "SCAGEUsers.api.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "SCAGEUsers.api.csproj" -c Release -o /app/publish /p:UseAppHost=false

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "SCAGEUsers.api.dll"]