import fs from "fs";
import path from "path";
import { fileURLToPath } from "url";

const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);

const structure = {
  // Environment Files (agregados por nosotros)
  ".env": "",  
  ".env.development": "",
  ".env.example": "",
  ".env.production": "",
  
  // Config Files (agregados por nosotros)
  ".prettierrc": "",
  
  src: {
    assets: {
      images: {
        logos: ["app-logo.png"],
        icons: ["default-user.png"],
        backgrounds: ["auth-bg.jpg"],
      },
      icons: {
        svg: ["home-icon.svg", "user-icon.svg", "settings-icon.svg"],
      },
      fonts: ["README.md"],
    },
    
    // Types
    types: ["global.d.ts"],
    
    // Utils (estructura completa)
    utils: {
      constants: [
        "app.ts",
        "api.ts", 
        "storage.ts",
        "validation.ts"
      ],
      helpers: [
        "formatters.ts",
        "validators.ts",
        "http.ts"
      ],
      hooks: [
        "useLocalStorage.ts"
      ]
    },
    
    data: {
      repositories: ["AuthRepository.ts", "UserLocalRepository.ts"],
      sources: {
        local: ["LocalStorage.ts"],
        remote: {
          api: ["ApiDelivery.ts"],
          models: ["ResponseApiDelivery.ts"],
        },
      },
    },
    
    domain: {
      entities: ["User.ts"],
      repositories: ["AuthRepository.ts", "UserLocalRepository.ts"],
      useCases: {
        auth: ["LoginAuth.ts", "RegisterAuth.ts"],
        userLocal: [
          "GetUserLocal.ts",
          "RemoveUserLocal.ts",
          "SaveUserLocal.ts",
        ],
      },
    },
    
    presentation: {
      components: ["CustomTextInput.tsx", "RoundedButton.tsx"],
      hooks: ["useUserLocal.ts"],
      theme: ["AppTheme.ts"],
      views: {
        home: ["Home.tsx", "Styles.ts", "ViewModel.ts"],
        profile: {
          info: ["ProfileInfo.tsx", "ViewModel.ts"],
        },
        register: ["Register.tsx", "Styles.ts", "ViewModel.ts"],
      },
    },
  },
  
  // Public (NUEVO)
  public: {
    "favicon.ico": "",
    "manifest.json": "",
    "robots.txt": "",
    "social-image.png": "",
    "vite.svg": "",
  },
};

function createStructure(basePath, structure) {
  for (const [key, value] of Object.entries(structure)) {
    const currentPath = path.join(basePath, key);

    if (typeof value === "object" && !Array.isArray(value)) {
      // Es un directorio con más contenido
      if (!fs.existsSync(currentPath)) {
        fs.mkdirSync(currentPath, { recursive: true });
        console.log(`📁 Directorio creado: ${currentPath}`);
      }
      createStructure(currentPath, value);
    } else if (Array.isArray(value)) {
      // Es un directorio con archivos
      if (!fs.existsSync(currentPath)) {
        fs.mkdirSync(currentPath, { recursive: true });
        console.log(`📁 Directorio creado: ${currentPath}`);
      }
      value.forEach((file) => {
        const filePath = path.join(currentPath, file);
        if (!fs.existsSync(filePath)) {
          // Archivos vacíos sin contenido
          fs.writeFileSync(filePath, "");
          console.log(`📄 Archivo creado: ${filePath}`);
        }
      });
    } else {
      // Es un archivo
      if (!fs.existsSync(currentPath)) {
        // Archivos vacíos sin contenido
        fs.writeFileSync(currentPath, "");
        console.log(`📄 Archivo creado: ${currentPath}`);
      }
    }
  }
}

// Crear la estructura
console.log("🚀 Creando estructura de carpetas...");
createStructure(".", structure);
console.log("✅ Estructura creada exitosamente!");
console.log("\n📁 Estructuras incluidas:");
console.log("   🌐 Environment Files    - .env, .env.*, .env.example");
console.log("   ⚙️  Config Files        - Prettier");
console.log("   📸 src/assets/          - Recursos estáticos");
console.log("   📊 src/types/           - Tipos globales TypeScript");
console.log("   🔧 src/utils/           - Utilidades y constantes");
console.log("   📊 src/data/            - Capa de datos");
console.log("   🏗️  src/domain/          - Lógica de negocio");
console.log("   🎨 src/presentation/    - Componentes UI");
console.log("   🌐 public/              - Archivos públicos");
console.log("\n💡 Nota: Los archivos base vienen con la inicialización del proyecto");

// Ejecutar el script
//      node create-structure.js