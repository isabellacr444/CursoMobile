# 📸 Flutter Gallery App – MVC com Localização e Data

Um aplicativo Flutter que permite **tirar fotos ou selecionar imagens da galeria**, salvando-as em uma **galeria interna**, exibindo **localização atual (cidade, latitude e longitude)** e a **data/hora no formato brasileiro**.  
Organizado em **arquitetura MVC (Model–View–Controller)** e utilizando as principais bibliotecas modernas do Flutter.

---

## 🚀 Funcionalidades

✅ Tirar foto com a câmera  
✅ Escolher imagem da galeria  
✅ Exibir todas as imagens lado a lado (estilo galeria)  
✅ Mostrar cidade, latitude e longitude ao clicar na imagem  
✅ Exibir data e hora no formato brasileiro  
✅ Arquitetura **MVC** organizada  
✅ Interface moderna e responsiva  

---

## 🏗️ Estrutura do Projeto

lib/
│
├── controllers/
│ └── photo_controller.dart # Lógica de captura, localização e integração com APIs
│
├── models/
│ └── photo_model.dart # Modelo de dados da foto (imagem, cidade, data, coords)
│
├── views/
│ └── image_screen.dart # Interface do app e galeria de fotos
│
└── main.dart # Ponto de entrada do aplicativo


---

## ⚙️ Instalação das Dependências

Abra o terminal no diretório do seu projeto e execute:

```bash
flutter pub add image_picker
flutter pub add geolocator
flutter pub add http
flutter pub add intl

```

---

# 🌍 API Utilizada

* 🌦️ OpenWeatherMap
 — para obter a cidade com base nas coordenadas de GPS.

* 📍 Geolocator
 — para capturar latitude e longitude.

* 🖼️ Image Picker
 — para acessar câmera e galeria.

* ⏰ Intl
 — para formatar a data e hora no formato brasileiro.

---


## 💡 Como Usar

1. **Execute o app:**

```bash

flutter run


2. Tire uma foto ou selecione da galeria.

3. A imagem aparecerá na galeria interna do app.

4. Toque na imagem → abrirá um modal com:

. 🌆 Cidade

. 📍 Coordenadas

. 🕒 Data e hora (formato brasileiro)

``` 

## 📱 Exemplo de Tela
+--------------------------------------+
|     Selecionar Imagem                |
|--------------------------------------|
|  [📷 Tirar Foto]   [🖼️ Galeria]      |
|--------------------------------------|
|  🖼️ Miniaturas das fotos             |
|  (toque para ver detalhes)           |
+--------------------------------------+

## 🧠 Arquitetura MVC
## Camada	Descrição
## Model  	*Representa os dados da foto (imagem, data, localização)*
## View	*Interface com o usuário (ImageScreen)*
## Controller	*Controla a lógica de negócio: tirar foto, buscar localização e cidade*

# 🕒 Formato da Data

### A data é exibida no padrão brasileiro:

**dd/MM/yyyy HH:mm**


# Exemplo:

### 📅 15/10/2025 14:32

# *👨‍💻 Autor*

## *Daniel Góes*

## 📘 LinkedIn - https://www.linkedin.com/in/daniel-goes-a856a4361/ 

## 💻 GitHub - https://github.com/dn-goes
