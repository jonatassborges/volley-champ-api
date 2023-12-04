import champ from "../../models/modelChamp.js";
const createChamp = async (req, res) => {
    try {
      const champData = req.body;
      const userId = req.userLogged.id
      if (req.userLogged.access !== "adm") {
        return res.status(400).json({
          error: "Apenas adm pode criar campeonatos",
        });
      } 
        const [result] = await champ.insert(userId, champData);
        if (result.affectedRows === 1) {
          return res.json({
            success: "Campeonato criado com Sucesso!",
            champ: {
              id: result.insertId,
              id_user: userId,
              ...champData,
            },
          });
        };
    } catch (error) {
      console.log(error.message);
      res.status(500).json({
        error: "Erro no servidor!",
      });
    }
  };
  
  export default createChamp;