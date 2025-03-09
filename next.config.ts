import type { NextConfig } from "next";

const nextConfig: NextConfig = {
  /* config options here */
 
};

module.exports = {
 images: {
    remotePatterns: [
      {
        protocol: "http",
        hostname: "localhost",
        port: "8090",
        pathname: "/images/**",
        search: '',
      }
    ]
  }
}

export default nextConfig;
