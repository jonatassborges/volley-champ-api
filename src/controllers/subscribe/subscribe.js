import subscribe from "../../models/subscribeModel.js";
const createSubscribe = async (req, res) => {
    try {
      const subscribeData = req.body;
      const userId = req.userLogged.id
      if (req.userLogged.access !== "player") {
        return res.status(400).json({
          error: "Apenas players podem se inscrever em campeonatos",
        });
      } 
        const [result] = await subscribe.insert(userId, subscribeData);
        if (result.affectedRows === 1) {
          return res.json({
            success: "inscrição feita com Sucesso!",
            champ: {
              id: result.insertId,
              subscribe_user: userId,
              ...subscribeData,
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
  
  export default createSubscribe;