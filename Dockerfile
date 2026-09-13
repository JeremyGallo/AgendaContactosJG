# Etapa 1: Compilación
FROM mcr.microsoft.com/dotnet/sdk:10.0 AS build

WORKDIR /src

# Copiar el archivo del proyecto
COPY ["AgendaContactosJG.csproj", "."]

# Restaurar dependencias
RUN dotnet restore

# Copiar el resto del proyecto
COPY . .

# Compilar y publicar
RUN dotnet publish -c Release -o /app/publish


# Etapa 2: Ejecución
FROM mcr.microsoft.com/dotnet/aspnet:10.0 AS final

WORKDIR /app

# Copiar la aplicación publicada
COPY --from=build /app/publish .

# Puerto de la aplicación
EXPOSE 8080

# Configurar ASP.NET Core
ENV ASPNETCORE_URLS=http://+:8080

# Ejecutar aplicación
ENTRYPOINT ["dotnet", "AgendaContactosJG.dll"]