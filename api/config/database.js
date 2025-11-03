import mongoose from 'mongoose';
import dotenv from 'dotenv';

dotenv.config();
 
const connect = () => {
    console.log(process.env.MONGODB_URL);
    mongoose.connect(process.env.MONGODB_URL, {
        // Additional options here
    })
    .then(() => {
        console.log("Database connected successfully");
    })
    .catch((error) => {
        console.log("Database connection error");
        console.error(error);
        process.exit(1); 
    });
}; 

export default connect;
