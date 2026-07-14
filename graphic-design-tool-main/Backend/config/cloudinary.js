const cloudinary = require("cloudinary").v2;

cloudinary.config({
  cloud_name: process.env.CLOUD_NAME,
  api_key: process.env.API_KEY,
  api_secret: process.env.API_SECRET,
  secure: true
});

const connectCloudinary = async () => {
  try {
    const result = await cloudinary.api.ping();

    console.log("Cloudinary Connected Successfully");
    console.log("Cloudinary Ping Status:", result?.status);
  } catch (error) {
    console.error("Cloudinary Connection Failed");

    if (error?.error) {
      console.error("Cloudinary Error:", error.error.message);
      console.error("HTTP Code:", error.error.http_code);
    } else {
      console.error(
        "Cloudinary Error:",
        error?.message || "Unknown error"
      );
    }
  }
};

connectCloudinary();

module.exports = cloudinary;
