// Import the necessary modules and models
import Champ from "../../models/modelChamp.js";

// Define the updateChamp function
const updateChamp = async (req, res) => {
  try {
    const champData = req.body;
    const userId = req.userLogged.id;
    if (req.userLogged.access !== "adm") {
      return res.status(400).json({
        error: "Apenas adm pode criar campeonatos",
      });
    }
    const [result] = await Champ.update(userId, champData);
    if (result.affectedRows === 1) {
      return res.json({
        success: "Campeonato atualizado com Sucesso!",
        champ: {
          id_user: userId,
          ...champData,
        },
      });
    }
  } catch (error) {
    console.log(error.message);
    res.status(500).json({
      error: "Erro no servidor!",
    });
  }
};

// Export the updateChamp function
export default updateChamp;
