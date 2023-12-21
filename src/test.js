
//npm install multer
import user from "../../models/userModel.js";
import bcrypt from "bcrypt";
import multer from "multer";

// Configuração do multer para armazenar as imagens no diretório 'uploads'
const storage = multer.diskStorage({
  destination: function (req, file, cb) {
    cb(null, 'uploads/');
  },
  filename: function (req, file, cb) {
    cb(null, Date.now() + '-' + file.originalname);
  }
});

const upload = multer({ storage: storage });

const createUser = async (req, res) => {
  try {
    const userData = req.body;
    
    // Adicione o middleware de upload para lidar com a imagem
    upload.single('photo')(req, res, async function (err) {
      if (err) {
        return res.status(500).json({
          error: "Erro no upload de imagem!",
        });
      }

      // Continue com o restante do código após o upload da imagem
      bcrypt.hash(userData.pass, 10, async (error, hash) => {
        if (error)
          return res.status(500).json({
            error: "Erro ao gerar senha criptografada!",
          });
        userData.pass = hash;

        // Altere o caminho da imagem conforme necessário
        userData.photo = req.file.path;

        const [result] = await user.insert(userData);
        delete userData.pass;
        if (result.affectedRows === 1) {
          res.json({
            success: "Usuário inserido com Sucesso!",
            user: {
              id: result.insertId,
              ...userData,
            },
          });
        }
      });
    });
  } catch (error) {
    console.log(error.message);
    res.status(500).json({
      error: "Erro no servidor!",
    });
  }
};

export default createUser;
