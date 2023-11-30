import user from "../../models/userModel.js";
import session from "../../models/sessionModel.js";
import { compare } from "bcrypt";
import jwt from "jsonwebtoken";
import { TOKEN_SECRET } from "../../config.js";

const login = async (req, res) => {
  try {
    const userData = req.body;
    console.log(userData);
    const [rows] = await user.getByEmail(userData.email);
    if (rows.length === 0) {
      return res.status(400).json({
        error: `Usuário ou senha inválidos! 1`,
      });
    }
    const userFound = rows[0];
    let passIsValid = false;
    try {
      passIsValid = await compare(userData.pass, userFound.pass);
      console.log(passIsValid);
    } catch (error) {
      return res.status(400).json({
        error: `Usuário ou senha inválidos! 2`,
      });
    }
    if (!passIsValid) {
      return res.status(400).json({
        error: `Usuário ou senha inválidos! 3`,
      });
    }
    //Criar um token JWT com algumas informações específicas (id e name do usuário)
    const token = jwt.sign(
      {
        id: userFound.id,
        name: userFound.name,
      },
      TOKEN_SECRET
    );
    //Criar uma sessão associada ao usuário no banco de dados usando o token gerado
    console.log(userFound, token);
    await session.create(userFound.id, token);
    // 3.Configurar um cookie chamado "token" no navegador do cliente
    res.cookie("token", token, {
      httpOnly: true, // 4. O cookie só pode ser acessado pelo servidor, não por scripts no navegador
      sameSite: "none", // 5. O cookie será enviado em solicitações de qualquer site de origem
      secure: true, // 6. O cookie só será enviado em conexões seguras (HTTPS)
      maxAge: 90 * 24 * 60 * 60 * 1000, // 7. O cookie expira após 90 dias (em milissegundos)
    });
    return res.json({
      success: `Usuário Logado com Sucesso!`,
      user: {
        id: userFound.id,
        name: userFound.name,
        email: userFound.email,
        photo: userFound.photo,
        access: userFound.access,
        nickname: userFound.nickname,
        sex: userFound.sex
      },
    });
  } catch (error) {
    console.log(error);
    res.status(500).json({
      error: "Erro no servidor!",
    });
  }
};

export default login;

//compara se o email do req.body é = o de agm do banco
//compara a senha do do req.body com a d qm encontrou no banco