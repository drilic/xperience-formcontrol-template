const webpackMerge = require("webpack-merge");

const baseWebpackConfig = require("@kentico/xperience-webpack-config");

module.exports = (opts, argv) => {
    const baseConfig = (webpackConfigEnv, argv) => {
        return baseWebpackConfig({
            // Sets the organizationName and projectName
            // The JS module is registered on the backend using these values
            orgName: "#ORGANIZATION#",
            projectName: "#PROJECT_NAME_MODULE#-component",
            webpackConfigEnv: webpackConfigEnv,
            argv: argv,
        });
    };

    const projectConfig = {
        module: {
            rules: [
                {
                    test: /\.(js|ts)x?$/,
                    exclude: [/node_modules/],
                    loader: "babel-loader",
                },
                {
                    test: /\.css$/,
                    use: ['style-loader', 'css-loader']
                }
            ],
        },
        output: {
            clean: true
        },
        // Webpack server configuration. Required when running the boilerplate in 'Proxy' mode.
        devServer: {
            port: #DEV_PORT#,
        },
    };

    return webpackMerge.merge(projectConfig, baseConfig(opts, argv));
};
