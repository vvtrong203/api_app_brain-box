# Sử dụng image cơ sở của .NET
FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS base
WORKDIR /app
EXPOSE 10000

# Giai đoạn build
FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /src
COPY ["BrainBoxAPI/BrainBoxAPI.csproj", "BrainBoxAPI/"]
RUN dotnet restore "BrainBoxAPI/BrainBoxAPI.csproj"
COPY . .
RUN dotnet publish "BrainBoxAPI/BrainBoxAPI.csproj" -c Release -o /app/publish

# Giai đoạn chạy
FROM base AS final
WORKDIR /app
COPY --from=build /app/publish .
ENTRYPOINT ["dotnet", "BrainBoxAPI.dll"]