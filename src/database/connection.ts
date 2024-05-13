import client from "./config"

const startDatabase = async () => {
    await client.connect();
    console.log(`Database started`);
};

export default startDatabase;