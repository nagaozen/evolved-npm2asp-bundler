var path = require("path");

module.exports = {

	output: {
		filename: "packages.js",
		path: path.resolve( __dirname, "dist" )
	},

	module: {
		rules: [
			{
				test: /\.jsx?$/,
				use: [ "babel-loader" ]
			}
		]
	}

};
